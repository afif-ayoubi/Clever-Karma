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

Future<void> authPopUp(
    {required BuildContext context,
    required VoidCallback forgotOnPressed,
    required VoidCallback btnOnPressed,
    required VoidCallback btnTextOnPressed,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required Map<String, dynamic> currentAuthData}) {
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
      final bool keyboardIsOpen = mediaQuery.viewInsets.bottom > 0;
      final isLoading = BlocProvider.of<UsersBloc>(context).state is LoadingUsersState;
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.w),
            ),
            child: Container(
              height: 600.h,
              padding: const EdgeInsets.symmetric(horizontal: 15).r,
              child: isLoading? LoadingWidget(): SingleChildScrollView(
                child: SafeArea(
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
                          controller: emailController),
                      Gap(currentAuthData['isLogin'] ? 20.h : 15.h),
                      CustomTextField(
                        hintText: "Password",
                        labelText: "Password",
                        controller: passwordController,
                        showVisibility: true,
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
                            ),
                      Gap(
                        currentAuthData['isLogin'] ? 80.h : 30.h,
                      ),
                      CustomBtn(
                          text: currentAuthData['btnText'],
                          width: true,
                          onPressed: btnOnPressed),
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
                                    ..onTap = () => btnTextOnPressed()),
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
      );
    },
  );
}
