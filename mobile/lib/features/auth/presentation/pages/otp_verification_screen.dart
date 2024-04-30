import 'package:flutter/material.dart';

import '../widgets/otp_pages/otp_detail_widget.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildBody());
  }

  Widget _buildBody() {
    return  OtpDetailWidget(
      title: 'OTP verification',
      body: 'check your email to see  the\nverification code',
      textBtn: 'Submit',
      isOtpVerificationPage: true,
      onPressed: () {},
    );
  }
}
