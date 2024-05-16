import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/org_profle_page/org_profile_detail_widget.dart';

class OrganizationProfilePage extends StatefulWidget {
  const OrganizationProfilePage({super.key});

  @override
  State<OrganizationProfilePage> createState() => _OrganizationProfilePageState();
}

class _OrganizationProfilePageState extends State<OrganizationProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: _buildWidget(),
      ),
    );
  }
  Widget _buildWidget(){
    return OrgProfileDetailWidget();
  }
}
