  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/theme/hex_color.dart';

  class OnBoardingBtn extends StatelessWidget {
  final VoidCallback onPressed;
    const OnBoardingBtn({super.key, required this.onPressed});

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: 80.h,
        width: 80.w,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: HexColor.whiteColor,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
          ),
          child: const Icon(Icons.arrow_forward_ios_sharp),
        ),
      );
    }
  }
