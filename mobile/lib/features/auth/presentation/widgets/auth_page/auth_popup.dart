import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_textfield.dart';

Future<void> authPopUp(BuildContext context) {
  TextEditingController emailController = TextEditingController();
  return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      context: context,
      pageBuilder: (context, _, __) {
        final theme = Theme.of(context).textTheme;

        return Center(
          child: (Container(
            height: 600.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(vertical: 55.h, horizontal: 15.w),
            decoration: BoxDecoration(
              color: HexColor.whiteColor,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Text(
                      "Sign in",
                      style: theme.displayMedium,
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      "Welcome back! Sign in to continue\nmaking a difference.",
                      textAlign: TextAlign.center,
                      style: theme.bodyMedium,
                    ),
                    CustomTextField(
                        labelText: "Email", controller: emailController),
                  ],
                ),
              ),
            ),
          )),
        );
      }).then((_) {
    emailController.dispose();
  });
}
