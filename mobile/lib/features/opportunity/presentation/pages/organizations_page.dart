import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';

import '../widgets/organization_page/custom_app_bar.dart';
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
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              color: HexColor.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(50).r,
                bottomRight: const Radius.circular(50).r,
              ),
            ),
            child: Stack(
              children: [
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
                const SearchForm(inSearchScreen: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
