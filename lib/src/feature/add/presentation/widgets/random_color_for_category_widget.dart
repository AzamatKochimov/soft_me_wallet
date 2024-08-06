import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorForCategoryWidget extends StatelessWidget {
  const RandomColorForCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: getRandomColor(),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }
}
