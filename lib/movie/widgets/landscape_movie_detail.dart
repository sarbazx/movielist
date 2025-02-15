import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'widgets.dart';

class LandscapeMovieDetail extends StatelessWidget {
  const LandscapeMovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: movie.id,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie.poster,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              MovieInfoSection(
                rating: movie.imdbRating,
                metascore: movie.metascore,
                runtime: movie.runtime,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              MovieTitlePlot(
                title: movie.title,
                plot: movie.plot,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
