import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../movie/cubit/movie_cubit.dart';
import '../models/movie.dart';
import 'widgets.dart';

class MoviesItem extends StatelessWidget {
  const MoviesItem({super.key, required this.movie});

  final Movie movie;

  void onTap(BuildContext context) {
    context.read<MovieCubit>().getMovie(movie.id);
    GoRouter.of(context).push('/${movie.id}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            MoviePoster(id: movie.id, poster: movie.poster),
            MovieTitle(title: movie.title, year: movie.year),
            MovieItemIcon(),
          ],
        ),
      ),
    );
  }
}
