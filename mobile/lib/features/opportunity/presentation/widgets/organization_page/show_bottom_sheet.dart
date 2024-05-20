import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/api/providers/followProvider.dart';
import '../../../../../core/constants/icons_manager.dart';
import '../../../domain/repositories/organization.dart';

void customShowBottomSheet(
  BuildContext context,
  Organization organization,
  String distanceText,
) {
  final randomNumber = Random().nextInt(90000000) + 10000000;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40.0).w,
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          final isFollowed =
              Provider.of<FollowedOrganizationsProvider>(context, listen: true)
                  .isOrganizationFollowed(organization);
          return Container(
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
                  Text(
                    organization.name,
                    style: context.displayMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isFollowed) {
                              Provider.of<FollowedOrganizationsProvider>(
                                      context,listen: false)
                                  .unfollowOrganization(organization);
                            } else {
                              Provider.of<FollowedOrganizationsProvider>(
                                      context,listen: false)
                                  .followOrganization(organization);
                            }
                          });
                        },
                        child: Text(
                          isFollowed ? 'Unfollow' : 'Follow',
                          style: context.bodyLarge!.copyWith(
                            color: isFollowed
                                ? HexColor.secondaryColor
                                : HexColor.primaryColor,
                            fontWeight: FontWeightManager.bold,
                          ),
                        ),
                      ),
                      Gap(5.w),
                      Icon(
                        isFollowed ? IconManager.remove : IconManager.add,
                        size: 15.sp,
                        color: isFollowed
                            ? HexColor.secondaryColor
                            : HexColor.primaryColor,
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
                  Text(
                    organization.aboutUs,
                    style: context.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    'How to volunteer',
                    style: context.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    organization.howToVolunteer,
                    style: context.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Gap(20.h),
                  Text(
                    'Contact us',
                    style: context.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
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
          );
        },
      );
    },
  );
}
