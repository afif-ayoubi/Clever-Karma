import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../common_widgets/custom_btn.dart';
import '../common_widgets/custom_textfield.dart';
import 'app_bar.dart';

class OtpDetailWidget extends StatelessWidget {
  const OtpDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: CustomAppBar()),
              Gap(60.h),
              Container(
                height: 127.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text('Forgot Password?', style: theme.displayMedium),
              Gap(45.h),
              Text(
                "Enter your email address\nto reset password?",
                textAlign: TextAlign.center,
                style: theme.bodyLarge!.copyWith(color: Colors.black),
              ),
              Gap(35.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: CustomTextField(
                    labelText: "Email", controller: emailController),
              ),
              Gap(100.h),
              CustomBtn(
                text: "Continue",
                onPressed: () {},
                width: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
