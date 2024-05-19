import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/change_password_api.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _confirmController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(_confirmController, _passwordController, context));
  }

  Widget _buildBody(TextEditingController _confirmController,
      TextEditingController _passwordController, BuildContext context) {
    return OtpDetailWidget(
      title: 'Reset Password',
      textBtn: 'Continue',
      isResetPasswordPage: true,
      confirmPasswordController: _confirmController,
      passwordController: _passwordController,
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        final api = await changePasswordApi(
            password: _passwordController.text,
            email: prefs.getString('email')!,
            context: context);
        if (api) {
          context.go(Routes.authRoute);
        }
      },
    );
  }
}
