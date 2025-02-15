import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomBtn extends StatelessWidget {
  final bool width;
  final String text;
  final VoidCallback onPressed;
  const CustomBtn({super.key, this.width=false, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ? 175.w:100.w,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: FittedBox(
          child: Text(text,
              style: context.bodyMedium!.copyWith(
                  color: HexColor.whiteColor,
                  fontWeight: FontWeightManager.semiBold)),
        ),
      ),
    );
  }
}
