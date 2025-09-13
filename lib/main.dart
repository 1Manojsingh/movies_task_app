import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_colors.dart';
import 'core/theme/text_theme.dart';
import 'features/splash/views/splash_screen.dart';
import 'features/home/views/simple_home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Task App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        textTheme: appTextTheme,
        fontFamily: 'Inter',
      ),
      home: const SplashScreenPage(),
      routes: {
        '/home': (context) => const SimpleHomePage(),
      },
    );
  }
}