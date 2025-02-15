import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_btn.dart';

class OnBoardingDetailWidget extends StatelessWidget {
  final String title;
  final String body;
  final bool isFirst;
  final VoidCallback onPressed;
  final String imgPath;

  const OnBoardingDetailWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.body,
    this.isFirst = false,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      itemBuilder:(context,index)=> Container(
        width: double.infinity,
        height: 100.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgPath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Animate(
                    key: ValueKey(title),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: context.displayLarge,
                    ).animate().fade(delay: 0.5.seconds).slideY(
                          curve: Curves.easeInOut,
                        ),
                  ),
                  isFirst ? Gap(50.h) : Gap(25.h),
                  Animate(
                    key: ValueKey(body),
                    child: Text(
                      body,
                      style: context.bodyLarge,
                      textAlign: TextAlign.center,
                    ).animate().fade(delay: 1.5.seconds).slideY(
                          curve: Curves.easeInOut,
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 150.h,
              left: 0,
              right: 0,
              child: Center(
                child: OnBoardingBtn(onPressed: onPressed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
