import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';

import '../widgets/organization_page/custom_app_bar.dart';
import '../widgets/organization_page/organization_card.dart';
import '../widgets/organization_page/search_form.dart';

class OrganizationsPage extends StatelessWidget {
  const OrganizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 190.h,
            child: Stack(
              children: [
                Container(
                  height: 160.h,
                  decoration: BoxDecoration(
                    color: HexColor.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(50).r,
                      bottomRight: const Radius.circular(50).r,
                    ),
                  ),
                ),
                Positioned(
                  top: 20.r,
                  left: 20.r,
                  right: 20.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomAppBar(),
                      Text(
                        'Organizations',
                        style: context.displayLarge!
                            .copyWith(fontSize: FontSize.s20),
                      ),
                      Gap(45.w)
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0.r,
                    left: 10.r,
                    right: 10.r,
                    child: const SearchForm(inSearchScreen: true)),
              ],
            ),
          ),
          Gap(10.h),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const OrganizationCard();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Gap(10.h);
              },
            ),
          ),
        ],
      ),
    );
  }
}
