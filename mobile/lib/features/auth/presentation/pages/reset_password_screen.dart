import 'package:flutter/material.dart';

import '../widgets/otp_pages/otp_detail_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _confirmController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody(_confirmController, _passwordController));
  }

  Widget _buildBody(TextEditingController _confirmController,
      TextEditingController _passwordController) {
    return OtpDetailWidget(
      title: 'Reset Password',
      textBtn: 'Continue',
      isResetPasswordPage: true,
      confirmPasswordController: _confirmController,
      passwordController: _passwordController,
      onPressed: () {},
    );
  }
}
