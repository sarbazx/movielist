import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
    required this.id,
    required this.poster,
  });

  final String id;
  final String poster;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 250,
          width: double.infinity,
          child: Image.network(
            poster,
            fit: BoxFit.fitWidth,
            errorBuilder: (_, __, ___) => Container(
              height: 250,
              width: double.infinity,
              color: Colors.black,
              alignment: Alignment.center,
              child: const Text(
                'No Image Available',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
