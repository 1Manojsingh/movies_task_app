import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_task_app/features/splash/views/welcome_page.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utility/design_utility.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreenPage> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends ConsumerState<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _logoZoomInController;
  late Animation<double> _logoZoomInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation is complete, trigger the logo zoom animation
        _startLogoAnimation();
      }
    });

    _controller.forward();

    _logoZoomInController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoZoomInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _logoZoomInController,
        curve: const Interval(0, 1, curve: Curves.easeOut),
      ),
    );
  }

  void _startLogoAnimation() {
    _logoZoomInController.forward().then((_) {
      // Navigate to welcome screen after animation completes
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const WelcomePage()),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _logoZoomInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          return AnimatedBuilder(
            animation: _logoZoomInAnimation,
            builder: (context, child) {
              return Center(
                child: SizedBox(
                  width: screenWidth(context) * .4,
                  child: CustomPaint(
                    painter: SplashPainter(
                        _animation.value, _logoZoomInAnimation.value),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Transform.scale(
                          scale: 1 + _logoZoomInAnimation.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.movie,
                                size: (screenWidth(context) * .2) *
                                    (_logoZoomInAnimation.value + 1),
                                color: Colors.white,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Movie App',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24 * (_logoZoomInAnimation.value + 1),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SplashPainter extends CustomPainter {
  final double progress;
  final double fadeProgress;

  SplashPainter(this.progress, this.fadeProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 8.0;
    const startAngle = -1.5 * pi;
    const sweepAngle = 0.8 * pi;
    final rotationAngle = 2 * pi * progress;

    // Draw the circular progress indicator
    final indicatorPaint = Paint()
      ..color = Colors.white.withOpacity(1 - fadeProgress)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    canvas.drawArc(
      Rect.fromCircle(center: Offset.zero, radius: radius - strokeWidth / 2),
      startAngle,
      sweepAngle,
      false,
      indicatorPaint,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(SplashPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
