import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/assets_manager.dart';

class OnBoardingDetailWidget extends StatelessWidget {
  const OnBoardingDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
return ColorFiltered(
    colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.difference),
    child: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.onBoardingImg1), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Find Your Passion",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 50.h,
          ),
          Text(
            "What issues matter most to you",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    ),
  );  }
}