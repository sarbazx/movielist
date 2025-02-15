import 'package:flutter/material.dart';

class MovieItemIcon extends StatelessWidget {
  const MovieItemIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(30),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          Icons.arrow_right_rounded,
          size: 48,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
