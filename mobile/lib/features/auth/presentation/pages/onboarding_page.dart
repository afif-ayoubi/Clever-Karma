import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/assets_manager.dart';
import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_detail_widget.dart';
import 'package:mobile/routes/class_routes.dart';

import '../bloc/obBoarding/on_boarding_bloc.dart';
import '../bloc/obBoarding/on_boarding_event.dart';
import '../bloc/obBoarding/on_boarding_state.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> onBoardingData = [
    {
      'title': "Find Your Passion",
      'body': "What issues matter most to you",
      'isFirst': true,
      'imgPath': AppImages.onBoardingImg1,
    },
    {
      'title': "Making a Difference\n Together",
      'body': "Explore Causes You Care\n About",
      'isFirst': false,
      'imgPath': AppImages.onBoardingImg2,
    },
    {
      'title': "Your Impact Starts\n Here",
      'body': "Choose Causes That Align With\n Your Value",
      'isFirst': false,
      'imgPath': AppImages.onBoardingImg3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.currentIndex >= onBoardingData.length) {
            context.go(Routes.authRoute);
          }
        },
        builder: (context, state) {
          return PageView.builder(
            itemCount: onBoardingData.length,
            controller: _pageController,
            onPageChanged: (index) {
              context.read<OnboardingBloc>().add(IncrementIndex());
            },
            itemBuilder: (context, index) => OnBoardingDetailWidget(
              title: onBoardingData[state.currentIndex]['title'],
              body: onBoardingData[state.currentIndex]['body'],
              isFirst: onBoardingData[state.currentIndex]['isFirst'],
              imgPath: onBoardingData[state.currentIndex]['imgPath'],
              onPressed: () {
                if (state.currentIndex == onBoardingData.length - 1) {
                  context.go(Routes.authRoute);
                } else {
                  context.read<OnboardingBloc>().add(IncrementIndex());
                }              },
            ),
          );
        },
      ),
    );
  }
}
