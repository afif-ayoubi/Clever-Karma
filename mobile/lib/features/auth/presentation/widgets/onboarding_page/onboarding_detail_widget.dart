import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/assets_manager.dart';
import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_btn.dart';

class OnBoardingDetailWidget extends StatelessWidget {
  final String title;
  final String body;
  final bool isFirst;
  final String imgPath;
  const OnBoardingDetailWidget(
      {super.key,
      required this.title,
      required this.body,
      this.isFirst = false,
      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ColorFiltered(
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.difference),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.onBoardingImg1),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Animate(
                    
                    child: Text(
                      "Find Your Passion",
                      style: theme.displayLarge,
                    ).animate().fade(delay: 1.seconds).slideY(curve: Curves.easeInOut,),
                  ),
                  Padding(
                    padding: isFirst
                        ? EdgeInsets.only(top: 50.h)
                        : EdgeInsets.only(top: 25.h),
                    child: Text(
                      "What issues matter most to you",
                      style: theme.bodyLarge,
                      textAlign: TextAlign.center,
                    )..animate().fade(delay: 2.seconds).slideY(curve: Curves.easeInOut,),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 150.h,
              left: 0,
              right: 0,
              child: Center(
                child: OnBoardingBtn(onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
