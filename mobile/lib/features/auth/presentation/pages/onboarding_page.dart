import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }
}

Widget _buildBody() {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(''), fit: BoxFit.cover)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("afif"),
        SizedBox(
          height: 50.h,
        ),
        const Text("hello")
      ],
    ),
  );
}
