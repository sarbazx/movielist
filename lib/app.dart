import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie/cubit/movie_cubit.dart';
import 'movies/bloc/movies_bloc.dart';
import 'router.dart';
import 'services/client.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final client = Client.instance.client;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(client: client)..add(GetMovies()),
        ),
        BlocProvider(
          create: (context) => MovieCubit(client: client),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
