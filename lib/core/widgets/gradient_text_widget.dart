import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final List<Color> gradientColors;
  final List<double>? stops;

  const GradientText({
    required this.text,
    required this.style,
    required this.gradientColors,
    this.stops,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        stops: stops,
      ).createShader(bounds),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}