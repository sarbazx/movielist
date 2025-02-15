import 'package:flutter/material.dart';

class MovieTitlePlot extends StatelessWidget {
  const MovieTitlePlot({
    super.key,
    required this.title,
    required this.plot,
  });

  final String title;
  final String plot;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(plot, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
