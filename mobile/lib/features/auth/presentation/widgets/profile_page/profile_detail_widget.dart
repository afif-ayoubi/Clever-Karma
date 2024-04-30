import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/theme/hex_color.dart';

import '../common_widgets/app_bar.dart';

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: CustomAppBar()),
              Gap(35.h),
              Container(
                height: 160.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.r),
                  border: Border.all(color: HexColor.borderColor),
                ),
                child:  Icon(Icons.person_outline,
                  size: 140.r,
                  color: HexColor.lightColor,
                ), // Changed FaIcon to Icon
              ),
            ],
          ),
        ),
      ),
    );
  }
}
