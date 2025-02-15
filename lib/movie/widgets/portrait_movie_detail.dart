import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'widgets.dart';

class PortraitMovieDetail extends StatelessWidget {
  const PortraitMovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
                    image: NetworkImage(movie.poster),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              MovieInfoSection(
                rating: movie.imdbRating,
                metascore: movie.metascore,
                runtime: movie.runtime,
              ),
            ],
          ),
        ),
        MovieTitlePlot(
          title: movie.title,
          plot: movie.plot,
        ),
      ],
    );
  }
}
