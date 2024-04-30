import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/widgets/profile_page/profile_detail_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ProfileDetailWidget();
  }
}
