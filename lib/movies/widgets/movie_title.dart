import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.title,
    required this.year,
  });

  final String title;
  final String year;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 250,
          padding: EdgeInsets.only(
            left: 16,
            bottom: 16,
            right: MediaQuery.of(context).size.width * 0.2,
          ),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.grey.withAlpha(100),
                Colors.black.withAlpha(40),
                Colors.black.withAlpha(20),
                Colors.black,
              ],
              stops: [0, 0.1, 0.2, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                year,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }
}
