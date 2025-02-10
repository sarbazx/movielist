part of 'movies_bloc.dart';

abstract class MoviesState {
  final List<Movie> movies;
  final bool hasReachedEnd;

  const MoviesState({
    this.movies = const [],
    this.hasReachedEnd = false,
  });
}

class MoviesLoading extends MoviesState {
  const MoviesLoading({super.movies, super.hasReachedEnd});
}

class MoviesLoaded extends MoviesState {
  const MoviesLoaded({required super.movies, required super.hasReachedEnd});
}

class MoviesError extends MoviesState {
  final Object error;

  const MoviesError(this.error, {super.movies});

  @override
  String toString() => error.toString();
}
