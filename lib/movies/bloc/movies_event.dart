part of 'movies_bloc.dart';

abstract class MoviesEvent {}

class GetMovies extends MoviesEvent {}

class LoadMoreMovies extends MoviesEvent {}

class RefreshMovies extends MoviesEvent {}

class SearchMovies extends MoviesEvent {
  final String search;

  SearchMovies({this.search = 'batman'});
}
