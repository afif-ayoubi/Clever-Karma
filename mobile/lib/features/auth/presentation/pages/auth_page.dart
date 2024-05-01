import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/hex_color.dart';
import '../../../../routes/class_routes.dart';
import '../widgets/auth_page/auth_popup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  Map<String, dynamic> signIn = {
    'title': "Sign In",
    'body': "Welcome back! Sign in to continue\nmaking a difference.",
    'btnText': "Sign In",
    'caption': "Don't have an account?",
    'isLogin': true,
  };

  Map<String, dynamic> signUp = {
    'title': "Sign Up",
    'body': "Unlock your potential to make a\n difference. ",
    'btnText': "Sign Up",
    'caption': "Already have an account?",
    'isLogin': false,
  };

  late Map<String, dynamic> currentAuthData;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      currentAuthData = signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    void _toggleAuth() {
      Future.delayed(Duration.zero, () {
        authPopUp(
            currentAuthData: currentAuthData,
            context: context,
            forgotOnPressed: () {
              context.push(Routes.forgotPasswordRoute);
            },
            btnOnPressed: () {},
            btnTextOnPressed: () {
              print(
                  'convert to ${currentAuthData == signIn ? signUp : signIn}');
              setState(() {
                currentAuthData = currentAuthData == signIn ? signUp : signIn;
              });
            });
      });
    }
    return Container(
      color: HexColor.primaryColor,
    );
  }
}
