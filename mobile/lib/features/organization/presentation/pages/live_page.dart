import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/api/providers/loader_provider.dart';
import 'package:mobile/core/api/providers/single_organization.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/features/opportunity/domain/repositories/organization.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/sendNotification_api.dart';
import '../../../auth/core/util/validation.dart';
import '../../../auth/presentation/widgets/common_widgets/custom_btn.dart';
import '../../../auth/presentation/widgets/common_widgets/custom_textfield.dart';
import '../../../live_streaming/presentation/pages/live_streaming.dart';

class LiveStreamingPage extends StatelessWidget {
  const LiveStreamingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildWidget(context),
      ),
    );
  }

  Widget _buildWidget(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    final organization =
        Provider.of<OrganizationProvider>(context).organizations;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Main Page",
            style: context.displayMedium,
          ),
          Center(
            child: CustomBtn(
              text: "Start Live",
              onPressed: () => _jumpToLivePage(context, organization!),
              width: true,
            ),
          ),
          Column(
            children: [
              CustomTextField(
                hintText: "Hello Volunteers",
                labelText: "Title",
                controller: titleController,
                validator: (value) => Validation.validate(value, context),
              ),
              Gap(20.h),
              CustomTextField(
                hintText: "The live will begin in 10 min",
                labelText: "Body",
                controller: bodyController,
                maxLines: 2,
                validator: (value) => Validation.validate(value, context),
              ),
            ],
          ),
          Center(
            child: CustomBtn(
              text: "Send Notification",
              onPressed: () async {
                Provider.of<LoaderProvider>(context, listen: false)
                    .setLoader(true);
                await SendNotification(
                    context: context,
                    title: titleController.text,
                    body: bodyController.text);
                Provider.of<LoaderProvider>(context, listen: false) 
                    .setLoader(false);
              },
              width: true,
            ),
          ),
        ],
      ),
    );
  }
}

void _jumpToLivePage(BuildContext context, Organization user) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LivePage(
        isHost: true,
        username: user.name,
        liveId: user.liveStreamingId,
        userID: user.id,
      ),
    ),
  );
}
