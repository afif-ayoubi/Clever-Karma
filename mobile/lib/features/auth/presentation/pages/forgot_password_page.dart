import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return OtpDetailWidget(
        title: 'Forgot Password?',
        body: 'Enter your email address\nto reset password?',
        textBtn: 'Continue',
        onPressed: () =>
            context.push(Routes.otpVerificationRoute)

    );
  }
}
