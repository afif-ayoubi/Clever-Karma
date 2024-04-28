  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:mobile/core/constants/assets_manager.dart';
  import 'package:mobile/core/theme/hex_color.dart';
  import 'package:mobile/features/auth/presentation/widgets/onboarding_page/onboarding_detail_widget.dart';

  class OnBoardingPage extends StatefulWidget {
    const OnBoardingPage({super.key});

    @override
    State<OnBoardingPage> createState() => _OnBoardingPageState();
  }

  class _OnBoardingPageState extends State<OnBoardingPage> {
    int currentIndex = 0;

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
      if(currentIndex < onBoardingData.length - 1){
      setState(() {
        currentIndex += 1;
      });
    }
    else{
      print(onBoardingData.length);
        showGeneralDialog(
            context: context,
            pageBuilder: (context, _, __) => (Container(
                  height: 620.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: HexColor.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                )));
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: _buildBody(context),
      );
    }

    Widget _buildBody(BuildContext context) {
      return SizedBox(
          child: ListView.builder(
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
          return OnBoardingDetailWidget(
            
            title: onBoardingData[currentIndex]['title'],
            body: onBoardingData[currentIndex]['body'],
            isFirst: onBoardingData[currentIndex]['isFirst'],
            imgPath: onBoardingData[currentIndex]['imgPath'],
            onPressed: _incrementIndex,
          );
        },
      ));
    }
  }
