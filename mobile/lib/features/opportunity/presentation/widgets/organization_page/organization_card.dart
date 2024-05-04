import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/extensions/text_theme.dart';

import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/font_manager.dart';
import '../../../../../core/theme/hex_color.dart';
import 'map_btn.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 185.h,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20).r,
                height: 166.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor.primaryColor,
                  borderRadius: BorderRadius.circular(12).w,
                  image: const DecorationImage(
                    image: AssetImage(AppImages.imgImg1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 30.r,
                top: 10.r,
                child: Text(
                  'Check Live',
                  style: context.bodyMedium!.copyWith(
                    fontSize: FontSize.s14,
                    color: HexColor.secondaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: HexColor.secondaryColor,
                    decorationThickness: 1.0.sp,
                  ),
                ),
              ),
              Positioned(
                  right: 30.r,
                  bottom: 0.r,
                  child:const MapBtn()),
            ],
          ),
        )
      ],
    );
  }
}
