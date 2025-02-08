import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text('Movies List'),
        ElevatedButton(
          onPressed: () => GoRouter.of(context).push('/1234'),
          child: Text('Go to detail page'),
        ),
        Spacer(),
      ],
    );
  }
}
