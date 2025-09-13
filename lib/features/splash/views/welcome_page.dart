import 'package:flutter/material.dart';
import 'package:movie_task_app/core/constants/paths.dart';
import 'package:movie_task_app/core/theme/text_theme.dart';
import 'package:movie_task_app/core/utility/design_utility.dart';
import 'package:movie_task_app/core/widgets/app_padding.dart';
import '../../../core/theme/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultAppPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth(context)*1,
              height: screenHeight(context)*0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image:  const DecorationImage(image: AssetImage(AppPaths.welcomeImg))
              ),
            ),
            verticalSpaceRegular,
            Text(
              "Find the latest and greatest movies of all time.",
              style: appTextTheme.labelMedium,
            ),
            verticalSpaceRegular,
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to home or main app
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NextWelcomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Get Started",
                  style: appTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class NextWelcomePage extends StatelessWidget {
  const NextWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultAppPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth(context)*1,
              height: screenHeight(context)*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image:  const DecorationImage(image: AssetImage(AppPaths.welcomeImg2))
                ),
            ),
            verticalSpaceRegular,
            Text(
              "Enjoy latest shows,movies all for free of cost",
              style: appTextTheme.labelMedium,
            ),
            verticalSpaceRegular,
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalWelcomePage()));
                  // Navigate to home or main app
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Get Started",
                  style: appTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FinalWelcomePage extends StatelessWidget {
  const FinalWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultAppPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth(context)*1,
              height: screenHeight(context)*0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image:  const DecorationImage(image: AssetImage(AppPaths.welcomeImg3))
              ),
            ),
            verticalSpaceRegular,
            Text(
              "Almost ready to go . Enjoy!",
              style: appTextTheme.labelMedium,
            ),
            verticalSpaceRegular,
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to home or main app
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Get Started",
                  style: appTextTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
