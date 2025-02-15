import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_cubit.dart';
import 'widgets.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.67,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * 0.6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(state.movie.poster),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      MovieInfoSection(
                        rating: state.movie.imdbRating,
                        metascore: state.movie.metascore,
                        runtime: state.movie.runtime,
                      ),
                    ],
                  ),
                ),
                MovieTitlePlot(
                  title: state.movie.title,
                  plot: state.movie.plot,
                ),
              ],
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
