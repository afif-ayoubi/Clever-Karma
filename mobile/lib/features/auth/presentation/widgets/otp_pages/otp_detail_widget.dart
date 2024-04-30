import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/theme/hex_color.dart';

import '../../../../../core/constants/assets_manager.dart';
import '../common_widgets/custom_btn.dart';
import '../common_widgets/custom_textfield.dart';
import 'app_bar.dart';
import 'otp_verification_field.dart';

class OtpDetailWidget extends StatelessWidget {
  final String title;
  final String body;
  final String textBtn;
  final VoidCallback onPressed;
  final bool isOtpVerificationPage;
  final bool isResetPasswordPage;

  const OtpDetailWidget(
      {super.key,
      required this.title,
      required this.body,
      this.isOtpVerificationPage = false,
      this.isResetPasswordPage = false,
      required this.textBtn,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20).r,
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
            Text(title, style: theme.displayMedium),
            Gap(45.h),
            Text(
              body,
              textAlign: TextAlign.center,
              style: theme.bodyLarge!.copyWith(color: Colors.black),
            ),
            Gap(35.h),
            isOtpVerificationPage
                ? const OtpVerificationField()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                    child: CustomTextField(
                        labelText: "Email", controller: emailController),
                  ),
            isOtpVerificationPage
                ? const Divider(
                    color: HexColor.primaryColor,
                    thickness: 1,
                  )
                : const SizedBox(),
            Gap(100.h),
            CustomBtn(
              text: textBtn,
              onPressed: onPressed,
              width: true,
            ),
          ],
        ),
      ),
    );
  }
}
