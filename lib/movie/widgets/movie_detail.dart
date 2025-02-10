import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_cubit.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieLoaded) {
          return Column(
            children: [
              Hero(
                tag: state.movie.id,
                child: Image.network(state.movie.poster),
              ),
              Text(
                state.movie.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          );
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
