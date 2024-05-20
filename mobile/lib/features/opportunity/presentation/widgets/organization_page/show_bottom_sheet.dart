import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/icons_manager.dart';

void customShowBottomSheet(
  BuildContext context,
  String name,
  String aboutUs,
  String howToVolunteer,
) {
  final randomNumber = Random().nextInt(90000000) + 10000000;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40.0).w,
      ),
    ),
    builder: (context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffE9E7E7),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0).w,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15).r,
              child: Center(
                child: Container(
                  height: 7.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: HexColor.whiteColor,
                    borderRadius: BorderRadius.circular(5).w,
                  ),
                ),
              ),
            ),
            Gap(5.h),
            Text(name,
                style: context.displayMedium!.copyWith(
                  color: Colors.black,
                )),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('follow',
                    style: context.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeightManager.bold,
                    )),
                Gap(5.w),
                Icon(
                  IconManager.add,
                  size: 15.sp,
                  color: Colors.black,
                ),
              ],
            ),
            Gap(20.h),
            Text(
              'About us',
              style: context.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeightManager.bold,
              ),
            ),
            Gap(10.h),
            Text(aboutUs,
                style: context.bodyMedium!.copyWith(
                  color: Colors.black,
                )),
            Gap(20.h),
            Text(
              'How to volunteer',
              style: context.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeightManager.bold,
              ),
            ),
            Gap(10.h),
            Text(howToVolunteer,
                style: context.bodyMedium!.copyWith(
                  color: Colors.black,
                )),
            Gap(20.h),
            Text('Contact us',
                style: context.bodyLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeightManager.bold,
                )),
            Gap(10.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    launch('sms:$randomNumber');
                  },
                  child: Icon(
                    IconManager.sms,
                    size: 30.sp,
                    color: Colors.black,
                  ),
                ),
                Gap(20.w), 
                GestureDetector(
                  onTap: () {
                    launch('tel:$randomNumber');
                  },
                  child: Icon(
                    IconManager.call,
                    size: 30.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
