import 'package:flutter/material.dart';
import 'package:movie_task_app/core/theme/text_theme.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = commonTheme;
}

final commonTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
    ),
    useMaterial3: false,
    appBarTheme: const AppBarTheme(elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: appTextTheme.bodySmall,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.thirdColor,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.thirdColor,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppColors.thirdColor,
          width: 1.0,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    ),
    primaryColor: AppColors.primary);

const lightColorScheme = ColorScheme.light(primary: Color(0xFF6C5DD3));
const dartColorScheme = ColorScheme.dark(primary: Color(0xFF6C5DD3));

