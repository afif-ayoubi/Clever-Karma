import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/icons_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/features/opportunity/domain/repositories/organization.dart';
import 'package:mobile/routes/class_routes.dart';
import 'package:provider/provider.dart';

import '../../../../../core/api/providers/user_provider.dart';
import '../../../../../core/constants/assets_manager.dart';
import '../../../../../core/constants/font_manager.dart';
import '../../../../../core/theme/hex_color.dart';
import '../../../../live_streaming/presentation/pages/live_streaming.dart';
import 'map_btn.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({
    super.key,
    required this.organization,
  });

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 185.h,
          child: _CardWidget(liveId: organization.liveStreamingId),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: Text(
            organization.name,
            style: context.bodyMedium!.copyWith(
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 15).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  IconManager.location,
                  size: 25.sp,
                ),
                Text("Lebanon, Beirut - 1.1 km from you"),
              ],
            )),
        Gap(10.h),
        Divider(
          color: Colors.black,
          thickness: 1.0.sp,
          indent: 20.r,
          endIndent: 20.r,
        ),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    super.key,
    required this.liveId,
  });

  final String liveId;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).User;
    final String randomUserID = Random().nextInt(10000).toString();
    return Stack(
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
          child: GestureDetector(
            onTap: () => JumpToLivePage(
                context: context,
                isHost: false,
                username: user?.firstName ?? "user_$randomUserID",
                liveId: liveId,
                userID: user?.id ?? randomUserID),
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
        ),
        Positioned(
            right: 30.r,
            bottom: 0.r,
            child: MapBtn(
              onPress: () => context.push(Routes.mapPage),
            )),
      ],
    );
  }
}

JumpToLivePage(
    {required BuildContext context,
    required bool isHost,
    required String username,
    required String liveId,
    required String userID}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LivePage(
        isHost: isHost,
        username: username,
        liveId: liveId,
        userID: userID,
      ),
    ),
  );
}
