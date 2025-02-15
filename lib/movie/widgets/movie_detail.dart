import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_cubit.dart';
import 'widgets.dart';

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
          return SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return LandscapeMovieDetail(movie: state.movie);
                }
                return PortraitMovieDetail(movie: state.movie);
              },
            ),
          );
        }
        return const Center(
          child: Text('Error! Something went wrong'),
        );
      },
    );
  }
}
