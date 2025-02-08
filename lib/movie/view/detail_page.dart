import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.movieId});

  final String? movieId;

  static String get pagePath => '/:movieId';

  static MaterialPage<void> _materialPage(Key key, String? movieId) =>
      MaterialPage(
        child: DetailPage(
          key: key,
          movieId: movieId,
        ),
      );

  static GoRoute get route => GoRoute(
        path: pagePath,
        pageBuilder: (context, state) => _materialPage(
          state.pageKey,
          state.pathParameters['movieId'],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MovieDetail();
  }
}
