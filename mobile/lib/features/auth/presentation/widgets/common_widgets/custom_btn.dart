import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomBtn extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback onPressed;
  const CustomBtn({super.key, this.width, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.sw,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
