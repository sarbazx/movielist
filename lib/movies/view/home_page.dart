import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/movies_list.dart';
import '../widgets/movies_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String get pagePath => '/';

  static MaterialPage<void> _materialPage(Key key) => MaterialPage(
        child: HomePage(key: key),
      );

  static GoRoute get route => GoRoute(
        path: pagePath,
        pageBuilder: (context, state) => _materialPage(state.pageKey),
      );

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MoviesSearch(),
        Expanded(child: MoviesList()),
      ],
    );
  }
}
