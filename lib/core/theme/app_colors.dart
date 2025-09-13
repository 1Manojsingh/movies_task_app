import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF61007D);
  static const Color secondary = Color(0xFF6A6A6A);
  static const Color thirdColor = Color(0xFFCACACA);
  static const Color shimmerBaseColorLight = Color.fromARGB(255, 230, 230, 230);
  static const Color greyColor2 = Color(0xFF6A6A6A);
  static const Color buttonTextColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color orangeColor = Color(0xFFFF9800);
  static const Color blackColor2 = Color(0XFF222222);
  static const Color purpleColor = Color(0xFFDFC9E4);
  static const Color greyColor3 = Color(0xFFD9D9D9);
  static const Color lightGreyColor = Color(0xFFF2F2F2);
}

Shader linearGradientTextColor = const LinearGradient(
  colors: <Color>[
    Color(0xFF61007D),
    Color(0xFFB000E3),
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 800.0, 40.0));

Shader linearGradientTextColorWeb = const LinearGradient(
  colors: <Color>[
    Color(0xFF61007D),
    Color(0xFFB000E3),
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 900.0, 20.0));
