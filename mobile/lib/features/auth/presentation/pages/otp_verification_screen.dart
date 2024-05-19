import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/opt_send_api.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return OtpDetailWidget(
        title: 'OTP verification',
        body: 'check your email to see  the\nverification code',
        textBtn: 'Resend code',
        isOtpVerificationPage: true,
        onPressed: () async{
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await sendOtpApi(email: prefs.getString('email')!);
        });
  }
}
