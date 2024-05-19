import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/core/constants/assets_manager.dart';
import 'package:email_validator/email_validator.dart';

import '../../../../../core/api/otp_verify_api.dart';
import '../../../../../core/util/snackbar_message.dart';
import '../../../../../routes/class_routes.dart';
import '../../../core/util/validation.dart';
import '../common_widgets/custom_btn.dart';
import '../common_widgets/custom_textfield.dart';
import '../common_widgets/app_bar.dart';
import 'otp_verification_field.dart';

class OtpDetailWidget extends StatelessWidget {
  final String title;
  final String? body;
  final String textBtn;
  final VoidCallback onPressed;
  final bool isOtpVerificationPage;
  final bool isResetPasswordPage;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;

  const OtpDetailWidget({
    super.key,
    required this.title,
    this.body,
    this.isOtpVerificationPage = false,
    this.isResetPasswordPage = false,
    required this.textBtn,
    required this.onPressed,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20).r,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: CustomAppBar()),
              Gap(60.h),
              Container(
                height: 130.h,
                width: 160.w,
                margin: const EdgeInsets.only(bottom: 5).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.logo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(title, style: context.displayMedium),
              Gap(isResetPasswordPage ? 30.h : 45.h),
              Text(
                body ?? "",
                textAlign: TextAlign.center,
                style: context.bodyLarge!.copyWith(color: Colors.black),
              ),
              Gap(isResetPasswordPage ? 0.h : 35.h),
              if (isResetPasswordPage)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                  child: CustomTextField(
                    controller: passwordController!,
                    hintText: "New Password",
                    validator: (value) =>
                        Validation.validatePassword(value, context),
                  ),
                )
              else if (isOtpVerificationPage)
                OtpVerificationField(
                  onOtpEntered: (otp) async {
                    print(otp);
                    if (otp.length == 4) {
                      final api = await verifyOtpApi(number: otp.toString());
                      if (api) {
                        context.push(Routes.resetPasswordRoute);
                      } else {
                        SnackBarMessage.instance.showErrorSnackBar(
                          message: 'Invalid OTP, Please try again',
                          context: context,
                        );
                      }
                    }
                  },
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                  child: CustomTextField(
                    hintText: 'john@gmail.com',
                    labelText: "Email",
                    controller: emailController!,
                    validator: (value) =>
                        Validation.validateEmail(value, context),
                  ),
                ),
              if (isResetPasswordPage)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
                  child: CustomTextField(
                    hintText: "Confirm Password",
                    controller: confirmPasswordController!,
                    validator: (value) => Validation.validateConfirmPassword(
                      value,
                      passwordController!.text,
                      context,
                    ),
                  ),
                )
              else if (isOtpVerificationPage)
                const Divider(
                  color: HexColor.primaryColor,
                  thickness: 1,
                )
              else
                const SizedBox(),
              Gap(isResetPasswordPage ? 110.h : 100.h),
              Gap(isOtpVerificationPage ? 8.h : 0.h),
              CustomBtn(
                text: textBtn,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    onPressed();
                  }
                },
                width: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
