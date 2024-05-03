import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/constants/icons_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard(
      {super.key, required this.translation, required this.opportunity});

  final double translation;
  final Opportunity opportunity;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, 80 * translation, 0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: HexColor.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(-7, 7),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const _OpportunityInfoRow(
              icon: Icon(IconManager.favorite),
              label: Text('Lived Saved'),
              data: '180',
            ),
            Gap(5.h),
            const _OpportunityInfoRow(
              icon: Icon(IconManager.people),
              label: Text('Organizations'),
              data: '180%',
            ),
            Gap(5.h),
            const _OpportunityInfoRow(
              icon: Icon(IconManager.organization),
              label: Text('Volunteers '),
              data: "100",
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: HexColor.whiteColor,
                thickness: 1,
                indent: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 10).r,
              child: Text(
                "Donate blood. Save lives. 180 lives saved this month. 10 Blood Donation Centers ready to welcome you.  180  Volunteers donated blood this month. Be a hero!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeightManager.regular,
                  color: HexColor.whiteColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OpportunityInfoRow extends StatelessWidget {
  const _OpportunityInfoRow({
    required this.icon,
    required this.label,
    required this.data,
  });

  final Icon icon;
  final Text label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35).r,
      child: Row(
        children: [
          Gap(32.w),
          IconTheme(
            data: IconThemeData(size: 18.sp, color: HexColor.whiteColor),
            child: icon,
          ),
          Gap(4.w),
          Expanded(
            child: DefaultTextStyle(
              style: context.bodyMedium!.copyWith(
                color: HexColor.whiteColor,
              ),
              child: label,
            ),
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeightManager.bold,
                color: HexColor.whiteColor),
          )
        ],
      ),
    );
  }
}
