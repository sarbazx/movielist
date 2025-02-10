part of 'movie_cubit.dart';

sealed class MovieState {}

final class MovieLoading extends MovieState {}

final class MovieLoaded extends MovieState {
  final Movie movie;

  MovieLoaded(this.movie);
}

final class MovieError extends MovieState {}
