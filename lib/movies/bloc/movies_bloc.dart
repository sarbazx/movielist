import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  int _currentPage = 1;
  String _currentSearch = 'batman';

  final Dio client;

  MoviesBloc({required this.client}) : super(const MoviesLoading()) {
    on<GetMovies>(_onGetMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
  }

  Future<void> _onGetMovies(
    GetMovies event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      emit(MoviesLoading());
      _currentPage = 1;
      _currentSearch = event.search;

      final response = await _fetchMovies(_currentPage, _currentSearch);
      if (response.statusCode == 200 && response.data['Response'] == 'True') {
        final body = response.data as Map;
        final searchResults = body['Search'] as List<dynamic>;
        final totalResults = int.parse(body['totalResults'] as String);
        final List<Movie> movies =
            searchResults.map((movie) => Movie.fromJson(movie)).toList();

        emit(
          MoviesLoaded(
            movies: movies,
            hasReachedEnd: movies.length >= totalResults,
          ),
        );
      } else {
        emit(const MoviesLoaded(movies: [], hasReachedEnd: true));
      }
    } catch (e) {
      emit(MoviesError(e));
    }
  }

  Future<void> _onLoadMoreMovies(
    LoadMoreMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (state is MoviesLoading || state.hasReachedEnd) return;

    try {
      emit(
        MoviesLoading(
          movies: state.movies,
          hasReachedEnd: state.hasReachedEnd,
        ),
      );
      _currentPage++;

      final response = await _fetchMovies(_currentPage, _currentSearch);
      if (response.statusCode == 200 && response.data['Response'] == 'True') {
        final body = response.data as Map;
        final searchResults = body['Search'] as List<dynamic>;
        final totalResults = int.parse(body['totalResults'] as String);
        final List<Movie> newMovies =
            searchResults.map((movie) => Movie.fromJson(movie)).toList();
        final allMovies = [...state.movies, ...newMovies];

        emit(MoviesLoaded(
          movies: allMovies,
          hasReachedEnd: allMovies.length >= totalResults,
        ));
      } else {
        emit(MoviesLoaded(movies: state.movies, hasReachedEnd: true));
      }
    } catch (e) {
      emit(MoviesError(e, movies: state.movies));
    }
  }

  Future<Response> _fetchMovies(int page, String search) {
    return client.get(
      '/',
      queryParameters: {
        'page': '$page',
        'type': 'movie',
        's': search,
      },
    );
  }
}
