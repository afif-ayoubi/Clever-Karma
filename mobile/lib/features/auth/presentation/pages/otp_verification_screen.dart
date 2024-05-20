import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/opt_send_api.dart';
import '../../../../core/api/providers/loader_provider.dart';
import '../../../../core/wdigets/loading_widget.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loading=Provider.of<LoaderProvider>(context).loading;
    return Stack(
      children: [
        Scaffold(resizeToAvoidBottomInset: false, body: _buildBody(context)),
        if (loading)
          Container(
            color: Colors.black54.withOpacity(0.7),
            height: double.infinity,
            width: 100.sw,
            child: LoadingWidget(),
          )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return OtpDetailWidget(
        title: 'OTP verification',
        body: 'check your email to see  the\nverification code',
        textBtn: 'Resend code',
        isOtpVerificationPage: true,
        onPressed: () async {
            Provider.of<LoaderProvider>(context, listen: false).setLoader(true);

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await sendOtpApi(email: prefs.getString('email')!, context: context);
          Provider.of<LoaderProvider>(context, listen: false).setLoader(false);
        });
  }
}
