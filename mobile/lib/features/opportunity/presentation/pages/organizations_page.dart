import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/providers/loader_provider.dart';
import '../../../../core/api/providers/organization_provider.dart';
import '../../../../core/wdigets/loading_widget.dart';
import '../widgets/organization_page/custom_app_bar.dart';
import '../widgets/organization_page/organization_card.dart';
import '../widgets/organization_page/search_form.dart';

class OrganizationsPage extends StatelessWidget {
  final String name;
  const OrganizationsPage({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<LoaderProvider>(context).loading;
    return Stack(
      children: [
        Scaffold(
          body: _buildBody(context),
        ),
        if (loading)
          Container(
            color: Colors.black54.withOpacity(0.7),
            height: double.infinity,
            width: 100.sw,
            child: LoadingWidget(),
          )
      ],
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
                        '$name',
                        style: context.displayLarge!
                            .copyWith(fontSize: FontSize.s20),
                      ),
                      Gap(45.w),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0.r,
                  left: 10.r,
                  right: 10.r,
                  child: const SearchForm(inSearchScreen: true),
                ),
              ],
            ),
          ),
          Gap(10.h),
          Expanded(
            child: Consumer<OrganizationsProvider>(
              builder: (context, provider, child) {
                final list = provider.organizations;
                if (list.isEmpty) {
                  return Center(
                    child: Text('No results found.', style: context.bodyMedium),
                  );
                }

                return ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return OrganizationCard(organization: list[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(10.h);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
