import 'package:flutter/material.dart';

import '../widgets/otp_pages/otp_detail_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: _buildBody());
  }

  Widget _buildBody() {
    return OtpDetailWidget(
      title: 'Reset Password',
      textBtn: 'Continue',
      isResetPasswordPage: true,
      onPressed: () {},
    );
  }
}
