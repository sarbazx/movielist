part of 'movies_bloc.dart';

abstract class MoviesEvent {}

class GetMovies extends MoviesEvent {
  final String search;

  GetMovies({this.search = 'batman'});
}

class LoadMoreMovies extends MoviesEvent {}
