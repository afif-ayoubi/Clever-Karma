import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_textfield.dart';

import '../common_widgets/custom_btn.dart';

Future<void> authPopUp({ required BuildContext context,required String title,required String body}) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  return showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    context: context,
    pageBuilder: (context, _, __) {
      final theme = Theme.of(context).textTheme;

      return Center(
        child: Builder(
          builder: (BuildContext context) {
            final MediaQueryData mediaQuery = MediaQuery.of(context);
            final bool keyboardIsOpen = mediaQuery.viewInsets.bottom > 0;

            return Container(
              height: 600.h,
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: keyboardIsOpen ? 0.h : 55.h, horizontal: 15.w),
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
                          "Sign in",
                          style: theme.displayMedium,
                        ),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Center(
                        child: Text(
                          "Welcome back! Sign in to continue\nmaking a difference.",
                          textAlign: TextAlign.center,
                          style: theme.bodyMedium,
                        ),
                      ),
                      Gap(40.h),
                      CustomTextField(
                          labelText: "Email", controller: emailController),
                      Gap(20.h),
                      CustomTextField(
                        labelText: "Password",
                        controller: passwordController,
                        showVisibility: true,
                      ),
                      Gap(5.h),
                      Text(
                        "Forgot Password?",
                        style: theme.bodyMedium,
                      ),
                      Gap(
                        70.h,
                      ),
                      CustomBtn(text: "Sign in", onPressed: () {}),
                      Gap(5.h),
                      Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: theme.bodyMedium,
                          ),
                          TextSpan(
                            text: "Sign up",
                            style: theme.bodyMedium!.copyWith(
                              color: HexColor.secondaryColor,
                            ),
                          )
                        ])),
                      )
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
  });
}
