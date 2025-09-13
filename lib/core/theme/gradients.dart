import 'package:flutter/material.dart';

class Gradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF61007D),
      Color(0xFFB000E3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [
      Color(0xFFFEEA75),
      Color(0xFFFEE66C),
      Color(0xFFFDD84E),
      Color(0xFFF8AF3C),
      Color(0xFFBD7611),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
