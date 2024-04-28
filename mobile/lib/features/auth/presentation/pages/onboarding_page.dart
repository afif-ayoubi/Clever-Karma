
import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_deatil_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(BuildContext context) {
  return OnBoardingDetailWidget();
}
