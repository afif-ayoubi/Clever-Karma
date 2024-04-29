import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 25.w,
      margin: EdgeInsets.only(top: 20.h, left: 20.w)
      decoration: BoxDecoration(
        color: HexColor.primaryColor,
        borderRadius: BorderRadius.circular(25.r)
      ),
      child: Icon(Icons.arrow_back_ios_new_sharp, color: HexColor.whiteColor, size: 20.sp,)
    );
  }
}
