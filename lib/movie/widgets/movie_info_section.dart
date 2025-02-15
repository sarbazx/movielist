import 'package:flutter/material.dart';

class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({
    super.key,
    required this.rating,
    required this.metascore,
    required this.runtime,
  });

  final String rating;
  final String metascore;
  final String runtime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.56,
      right: 0,
      child: Container(
        width: size.width * 0.7,
        height: 85,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onInverseSurface,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withAlpha(70),
              blurRadius: 50,
              offset: Offset(0, 20),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: size.width * 0.09,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  '$rating / 10',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            SizedBox(width: size.width * 0.05),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (double.tryParse(metascore) ?? 0) > 60
                        ? Colors.green
                        : Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      metascore,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Metascore',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            SizedBox(width: size.width * 0.05),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.av_timer_outlined,
                  color: Theme.of(context).colorScheme.error,
                  size: size.width * 0.09,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  runtime,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
