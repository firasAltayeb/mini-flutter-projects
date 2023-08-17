import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    required this.childWidget,
    this.containerWidth,
    super.key,
  });

  final Widget childWidget;
  final double? containerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.25, 0.6, 0.9],
          colors: [
            Colors.blue.shade200,
            Colors.blue.shade100,
            Colors.white,
            Colors.purple.shade100,
          ],
        ),
      ),
      child: childWidget,
    );
  }
}
