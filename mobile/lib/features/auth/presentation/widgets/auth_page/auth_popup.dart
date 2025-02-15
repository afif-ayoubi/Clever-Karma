import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/core/wdigets/loading_widget.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_textfield.dart';

import '../../bloc/users/users_bloc.dart';
import '../common_widgets/custom_btn.dart';
import 'package:mobile/features/auth/core/util/validation.dart';
Future<void> authPopUp({
  required BuildContext context,
  required VoidCallback forgotOnPressed,
  required VoidCallback btnOnPressed,
  required VoidCallback btnTextOnPressed,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required Map<String, dynamic> currentAuthData,
}) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    barrierLabel: "Auth",
    barrierDismissible: false,
    context: context,
    pageBuilder: (context, _, __) {
      final MediaQueryData mediaQuery = MediaQuery.of(context);

      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          final isLoading =
          context.watch<UsersBloc>().state is LoadingUsersState;

          return Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.w),
                    ),
                    child: Container(
                      height: 600.h,
                      padding: const EdgeInsets.symmetric(horizontal: 15).r,
                      child: SingleChildScrollView(
                        child: SafeArea(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentAuthData['title'],
                                  style: context.displayMedium,
                                ),
                                Gap(28.h),
                                Text(
                                  currentAuthData['body'],
                                  textAlign: TextAlign.center,
                                  style: context.bodyMedium,
                                ),
                                Gap(40.h),
                                CustomTextField(
                                  hintText: "john@gmail.com",
                                  labelText: "Email",
                                  controller: emailController,
                                  validator: (value) =>
                                      Validation.validateEmail(value, context),
                                ),
                                Gap(currentAuthData['isLogin'] ? 20.h : 15.h),
                                CustomTextField(
                                  hintText: "Password",
                                  labelText: "Password",
                                  controller: passwordController,
                                  showVisibility: true,
                                  validator: (value) =>
                                      Validation.validatePassword(value, context),
                                ),
                                Gap(currentAuthData['isLogin'] ? 5.h : 15.h),
                                currentAuthData['isLogin']
                                    ? GestureDetector(
                                  onTap: forgotOnPressed,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Forgot Password?",
                                      style: context.bodyMedium,
                                    ),
                                  ),
                                )
                                    : CustomTextField(
                                  hintText: "Password",
                                  labelText: "Confirm Password",
                                  controller: confirmPasswordController,
                                  showVisibility: true,
                                  validator: (value) =>
                                      Validation.validateConfirmPassword(
                                          value, passwordController.text, context),
                                ),
                                Gap(
                                  currentAuthData['isLogin'] ? 80.h : 30.h,
                                ),
                                CustomBtn(
                                  text: currentAuthData['btnText'],
                                  width: true,
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      btnOnPressed();
                                      setState(
                                              () {});
                                    }
                                  },
                                ),
                                Gap(10.h),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: currentAuthData['caption'],
                                          style: context.bodyMedium,
                                        ),
                                        TextSpan(
                                          text: currentAuthData['btnText'],
                                          style: context.bodyMedium!.copyWith(
                                            color: HexColor.secondaryColor,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => btnTextOnPressed(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading)
                Container(
                  color: Colors.black54.withOpacity(0.7),
                  height: double.infinity,
                  width: 100.sw,
                  child: LoadingWidget(),
                )
            ],
          );
        },
      );
    },
  );
}
