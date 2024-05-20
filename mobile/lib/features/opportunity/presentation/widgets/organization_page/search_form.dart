import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/core/constants/icons_manager.dart';

import '../../../../../core/api/providers/organization_providers.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key, this.inSearchScreen});

  final bool? inSearchScreen;

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.addListener(_searchOrganizations);
  }

  void _searchOrganizations() {
    final query = textController.text;
    final organizationsProvider = Provider.of<OrganizationsProvider>(context, listen: false);
    organizationsProvider.searchOrganizations(query);
  }

  @override
  void dispose() {
    textController.removeListener(_searchOrganizations);
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10).r,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(const Radius.circular(10).w),
            border: Border.all(color: const Color(0xffBEBBBB)),
          ),
          height: 52.h,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0).r,
                child: Icon(
                  IconManager.search,
                  color: HexColor.searchColor,
                  size: 30.sp,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10).r,
                  height: 50.h,
                  child: TextField(
                    controller: textController,
                    style: context.bodyMedium!.copyWith(color: HexColor.searchColor),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 11).r,
                      hintText: "Search",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintStyle: const TextStyle(color: HexColor.searchColor),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
