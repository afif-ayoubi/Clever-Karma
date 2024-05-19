import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/api/opt_send_api.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(context, _emailController));
  }

  Widget _buildBody(
      BuildContext context, TextEditingController _emailController) {
    return OtpDetailWidget(
        title: 'Forgot Password?',
        body: 'Enter your email address\nto reset password?',
        textBtn: 'Continue',
        emailController: _emailController,
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', _emailController.text);
         await sendOtpApi(email: _emailController.text);
            context.push(Routes.otpVerificationRoute);

        });
  }
}
