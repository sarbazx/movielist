import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie/cubit/movie_cubit.dart';
import 'movies/bloc/movies_bloc.dart';
import 'theme/cubit/app_theme_cubit.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc()..add(GetMovies()),
        ),
        BlocProvider(
          create: (context) => MovieCubit(),
        ),
        BlocProvider(
          create: (context) => AppThemeCubit(),
        )
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            darkTheme: FlexThemeData.dark(),
            theme: FlexThemeData.light(),
            themeMode: state.theme,
          );
        },
      ),
    );
  }
}
