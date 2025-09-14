import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF61007D);
  static const Color secondary = Color(0xFF6A6A6A);
  static const Color thirdColor = Color(0xFFCACACA);
  static const Color orangeColor = Color(0xFFFF9800);
  static const Color lightGreyColor = Color(0xFFF2F2F2);
}

Shader linearGradientTextColor = const LinearGradient(
  colors: <Color>[
    Color(0xFF61007D),
    Color(0xFFB000E3),
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 800.0, 40.0));
