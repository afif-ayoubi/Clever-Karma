import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/api/opt_send_api.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/api/providers/loader_provider.dart';
import '../../../../core/wdigets/loading_widget.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<LoaderProvider>(context).loading;
    final TextEditingController _emailController = TextEditingController();
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(context, _emailController)),
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

  Widget _buildBody(
      BuildContext context, TextEditingController _emailController) {
    return OtpDetailWidget(
        title: 'Forgot Password?',
        body: 'Enter your email address\nto reset password?',
        textBtn: 'Continue',
        emailController: _emailController,
        onPressed: () async {
          Provider.of<LoaderProvider>(context,listen: false).setLoader(true);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', _emailController.text);
         final api=await sendOtpApi(email: _emailController.text, context: context);
           if(api) context.push(Routes.otpVerificationRoute);
          Provider.of<LoaderProvider>(context,listen: false).setLoader(false);

        });
  }
}
