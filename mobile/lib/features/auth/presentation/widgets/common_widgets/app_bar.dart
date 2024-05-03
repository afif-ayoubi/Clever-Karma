import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/icons_manager.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.pop();
        },
      child: Container(
        height: 25.h,
        width: 25.w,
        decoration: BoxDecoration(
          color: HexColor.primaryColor,
          borderRadius: BorderRadius.circular(12.5.r)
        ),
        child: Icon(IconManager.arrowBack, color: HexColor.whiteColor, size: 15.sp,)
      ),
    );
  }
}
