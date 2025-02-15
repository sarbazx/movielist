import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movies_bloc.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(Icons.refresh),
      onPressed: () => context.read<MoviesBloc>().add(RefreshMovies()),
      label: Text('Refresh'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        iconColor: Colors.white,
        foregroundColor: Colors.white,
      ),
    );
  }
}
