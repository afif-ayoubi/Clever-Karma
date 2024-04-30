import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/assets_manager.dart';
import 'package:mobile/core/theme/hex_color.dart';

import '../widgets/common_widgets/custom_btn.dart';
import '../widgets/common_widgets/custom_textfield.dart';
import '../widgets/otp_pages/app_bar.dart';
import '../widgets/otp_pages/otp_detail_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: _buildBody());
  }

  Widget _buildBody() {
    return const OtpDetailWidget();
  }
}

