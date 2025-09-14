import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_task_app/core/constants/paths.dart';
import 'package:movie_task_app/core/theme/text_theme.dart';
import 'package:movie_task_app/core/utility/design_utility.dart';
import 'package:movie_task_app/core/widgets/app_padding.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/router/app_router.gr.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': AppPaths.welcomeImg,
      'title': "Find the latest and greatest movies of all time.",
      'buttonText': "Next",
    },
    {
      'image': AppPaths.welcomeImg2,
      'title': "Enjoy latest shows, movies all for free of cost",
      'buttonText': "Next",
    },
    {
      'image': AppPaths.welcomeImg3,
      'title': "Almost ready to go. Enjoy!",
      'buttonText': "Get Started",
    },
  ];

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.replace(const BaseRoute());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DefaultAppPadding(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _slides.length,
                  itemBuilder: (context, index) {
                    return _buildSlide(
                        _slides[index]['image']!, _slides[index]['title']!);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slides.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              verticalSpaceRegular,
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    _slides[_currentPage]['buttonText']!,
                    style: appTextTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlide(String imgPath, String title) {
    return DefaultAppPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth(context) * 1,
            height: screenHeight(context) * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          verticalSpaceRegular,
          Text(
            title,
            style: appTextTheme.bodyMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
