import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/assets_manager.dart';
import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_detail_widget.dart';
import 'package:mobile/routes/class_routes.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
late PageController _pageController;
  List<Map<String, dynamic>> onBoardingData = [
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

  void _incrementIndex() {
    if (currentIndex < onBoardingData.length - 1) {
      setState(() {
        currentIndex += 1;
      });
    } else {
      context.push(Routes.authRoute);
    }
  }
@override
  void initState() {
  _pageController = PageController();

  super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingData.length,
      controller: _pageController,
      itemBuilder:(context,index)=> OnBoardingDetailWidget(
        title: onBoardingData[currentIndex]['title'],
        body: onBoardingData[currentIndex]['body'],
        isFirst: onBoardingData[currentIndex]['isFirst'],
        imgPath: onBoardingData[currentIndex]['imgPath'],
        onPressed: _incrementIndex,
      ),
    );
  }
}
