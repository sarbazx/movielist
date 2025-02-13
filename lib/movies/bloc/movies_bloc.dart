import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/client.dart';
import '../../services/database_client.dart';
import '../models/movie.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  int _currentPage = 1;
  String _currentSearch = 'batman';

  final _client = Client.instance.client;
  final _db = DatabaseClient.instance;

  MoviesBloc() : super(MoviesInitial()) {
    on<GetMovies>(_onGetMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<RefreshMovies>(_onRefreshMovies);
    on<SearchMovies>(_onSearchMovies);
  }

  Future<void> _onGetMovies(GetMovies event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading(movies: state.movies));
    try {
      final cachedMovies = await _db.getMovies();
      if (cachedMovies.isNotEmpty) {
        emit(MoviesLoaded(movies: cachedMovies, hasReachedEnd: false));
        return;
      }

      final response = await _fetchMovies();
      if (response.statusCode == 200 && response.data['Response'] == 'True') {
        final body = response.data as Map;
        final searchResults = body['Search'] as List<dynamic>;
        final totalResults = int.parse(body['totalResults'] as String);

        final List<Movie> movies =
            searchResults.map((movie) => Movie.fromJson(movie)).toList();

        await _db.insertMovies(movies);

        emit(
          MoviesLoaded(
            movies: movies,
            hasReachedEnd: movies.length >= totalResults,
          ),
        );
      }
    } catch (e) {
      emit(MoviesError(e, movies: state.movies));
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

      final response = await _fetchMovies();
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

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoading(movies: []));
    _currentPage = 1;
    try {
      await _db.deleteMovies();
      await _onGetMovies(GetMovies(), emit);
    } catch (e) {
      emit(MoviesError(e, movies: state.movies));
    }
  }

  Future<void> _onSearchMovies(
    SearchMovies event,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesLoading(movies: state.movies));
    try {
      await _db.deleteMovies();
      _currentPage = 1;
      _currentSearch = event.search;
      await _onGetMovies(GetMovies(), emit);
    } catch (e) {
      emit(MoviesError(e, movies: state.movies));
    }
  }

  Future<Response> _fetchMovies() {
    return _client.get(
      '/',
      queryParameters: {
        'page': '$_currentPage',
        'type': 'movie',
        's': _currentSearch,
      },
    );
  }
}
