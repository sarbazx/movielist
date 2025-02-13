import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/client.dart';
import '../models/movie.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieLoading());

  final _client = Client.instance.client;

  Future<void> getMovie(String id) async {
    emit(MovieLoading());
    final response = await _fetchMovie(id);
    if (response.statusCode == 200) {
      final body = response.data;
      final movie = Movie.fromJson(body);
      emit(MovieLoaded(movie));
    } else {
      emit(MovieError());
    }
  }

  Future<Response> _fetchMovie(String id) {
    return _client.get(
      '/',
      queryParameters: {'i': id},
    );
  }
}
