import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/assets_manager.dart';

import '../widgets/common_widgets/app_bar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children:  [
          CustomAppBar(),
          Gap(60.h),
          Center(
            child: Container(
              height: 107.h,
              width: 127.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                image:  DecorationImage(
                  image: AssetImage(AppImages.),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
