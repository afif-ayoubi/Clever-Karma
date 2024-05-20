import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/change_password_api.dart';
import '../../../../core/api/providers/loader_provider.dart';
import '../../../../core/wdigets/loading_widget.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loading = Provider
        .of<LoaderProvider>(context)
        .loading;

    final TextEditingController _confirmController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(_confirmController, _passwordController, context)),
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

  Widget _buildBody(TextEditingController _confirmController,
      TextEditingController _passwordController, BuildContext context) {
    return OtpDetailWidget(
      title: 'Reset Password',
      textBtn: 'Continue',
      isResetPasswordPage: true,
      confirmPasswordController: _confirmController,
      passwordController: _passwordController,
      onPressed: () async {
        Provider.of<LoaderProvider>(context, listen: false).setLoader(true);

        final SharedPreferences prefs = await SharedPreferences.getInstance();

        final api = await changePasswordApi(
            password: _passwordController.text,
            email: prefs.getString('email')!,
            context: context);
        Provider.of<LoaderProvider>(context, listen: false).setLoader(false);

        if (api) {
          context.go(Routes.authRoute);
        }
      },
    );
  }
}
