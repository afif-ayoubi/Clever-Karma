import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_detail_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  List<Map<String, dynamic>> onBoardingData = [
    {
      'title': "Find Your Passion",
      'body': "What issues matter most to you",
      'isFirst': true,
      'imgPath': '',
    },
    {
      'title': "Making a Difference\n Together",
      'body': "Explore Causes You Care\n About",
      'isFirst': false,
      'imgPath': '',
    },
    {
      'title': "Your Impact Starts\n Here",
      'body': "Choose Causes That Align With\n Your Value",
      'isFirst': false,
      'imgPath': '',
    },
  ];
  return SizedBox(
     child:  ListView.builder(
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return OnBoardingDetailWidget(
            title: onBoardingData[index]['title'],
            body: onBoardingData[index]['body'],
            isFirst: onBoardingData[index]['isFirst'],
            imgPath: onBoardingData[index]['imgPath'],
          );
        },
      )
  );
}
