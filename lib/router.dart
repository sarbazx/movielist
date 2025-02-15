import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'movie/view/view.dart';
import 'movies/view/view.dart';

final router = GoRouter(
  initialLocation: HomePage.pagePath,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HeroControllerScope(
        controller: MaterialApp.createMaterialHeroController(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('MovieList'),
            leading: state.fullPath != '/'
                ? BackButton(
                    onPressed: () => context.pop(),
                  )
                : null,
          ),
          body: SafeArea(child: child),
        ),
      ),
      routes: [HomePage.route, DetailPage.route],
    ),
  ],
);
