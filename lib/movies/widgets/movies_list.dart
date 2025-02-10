import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies_bloc.dart';
import 'movies_item.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<MoviesBloc>().add(LoadMoreMovies());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading && state.movies.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.movies.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.no_photography_outlined, size: 100),
                SizedBox(height: 16),
                Text('No movies found'),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async => context.read<MoviesBloc>().add(GetMovies()),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: state.movies.length + (state is MoviesLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.movies.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return MoviesItem(movie: state.movies[index]);
            },
          ),
        );
      },
    );
  }
}
