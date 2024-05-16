import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';

class MapBtn extends StatelessWidget {
  final void Function()? onPress;
  const MapBtn({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: HexColor.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5).w,
          )),
      child: Text(
        'Map',
        style: context.bodyMedium!.copyWith(
          color: HexColor.whiteColor,
          fontWeight: FontWeightManager.semiBold,
        ),
      ),
    );
  }
}
