import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_textfield.dart';

import '../common_widgets/custom_btn.dart';

Future<void> authPopUp(
    {required BuildContext context,
    required String title,
    required String body,
    required String btnText,
    required String caption,
    required VoidCallback onPressed,
      required VoidCallback onPressed2,
      required VoidCallback onPressed3,
    bool isLogin = true}) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  return showGeneralDialog(
    transitionDuration: const Duration(milliseconds: 600),
    transitionBuilder: (_, a1, __, widget) {
      Tween<Offset> offset = Tween();
      offset = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: offset.animate(
          CurvedAnimation(
            parent: a1,
            curve: Curves.ease,
          ),
        ),
        child: widget,
      );
    },
    barrierLabel: "Label",
    barrierDismissible: true,
    context: context,
    pageBuilder: (context, _, __) {
      final theme = Theme.of(context).textTheme;
      final MediaQueryData mediaQuery = MediaQuery.of(context);
      final bool keyboardIsOpen = mediaQuery.viewInsets.bottom > 0;
      return Center(
        child: StatefulBuilder(
          builder: (BuildContext context,setState) {
            return Container(
              height: 600.h,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: keyboardIsOpen ? 0.h : 50.h, horizontal: 15.w),
              decoration: BoxDecoration(
                color: HexColor.whiteColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: theme.displayMedium,
                        ),
                      ),
                      Gap(28.h),
                      Center(
                        child: Text(
                          body,
                          textAlign: TextAlign.center,
                          style: theme.bodyMedium,
                        ),
                      ),
                      Gap(40.h),
                      CustomTextField(
                          labelText: "Email", controller: emailController),
                      Gap(isLogin ? 20.h : 15.h),
                      CustomTextField(
                        labelText: "Password",
                        controller: passwordController,
                        showVisibility: true,
                      ),
                      Gap(isLogin ? 5.h : 15.h),
                      isLogin
                          ? GestureDetector(
                        onTap: onPressed,
                            child: Text(
                                "Forgot Password?",
                                style: theme.bodyMedium,
                              ),
                          )
                          : CustomTextField(
                              labelText: "Confirm Password",
                              controller: confirmPasswordController,
                              showVisibility: true,
                            ),
                      Gap(
                        isLogin ? 70.h : 30.h,
                      ),
                      CustomBtn(text: btnText, onPressed: onPressed2),
                      Gap(5.h),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: caption,
                                style: theme.bodyMedium,
                              ),
                              TextSpan(
                                text: btnText,
                                style: theme.bodyMedium!.copyWith(
                                  color: HexColor.secondaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onPressed3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  ).then((_) {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  });
}
