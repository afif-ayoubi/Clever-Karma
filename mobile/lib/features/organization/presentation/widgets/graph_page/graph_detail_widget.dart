import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_btn.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

import '../../../../../core/wdigets/loading_widget.dart';
import 'line_chart_widget.dart';

class GraphDetailWidget extends StatelessWidget {
  const GraphDetailWidget({
    super.key,
    required this.dbRef,
    required this.list,
  });

  final Query dbRef;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DashBoard",
                style: context.displayMedium,
              ),
              CustomBtn(text: "Start Live", onPressed: ()=>JumpToLivePage(context, isHost: true),width: true,)
            ],
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                if (!snapshot.exists || snapshot.value == null)
                  return LoadingWidget();
                List<String> leftTitles = _generateLeftTitles(0);

                return Column(
                  children: [
                    Gap(30.h),
                    SizedBox(
                        height: 400.h,
                        child: LineChartWidget(
                            list: list, leftTitles: leftTitles)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _generateLeftTitles(int index) {
  List<String> leftTitles = [];

  if (index == 0) {
    leftTitles = ['0', '40', '60', '80', '100', '120'];
  } else if (index == 1) {
    leftTitles = ['0', '5', '10', '15', '20', '25'];
  } else if (index == 2) {
    leftTitles = ['0', '400', '1000', '2000', '3000', '4000'];
  } else {
    leftTitles = ['0', '10', '20', '30', '40', '50'];
  }
  return leftTitles;
}
JumpToLivePage(BuildContext context, {required bool isHost}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LivePage(isHost: isHost),
    ),
  );
}
final String userID = Random().nextInt(10000).toString();

class LivePage extends StatelessWidget {
  const LivePage({Key? key, this.isHost = false}) : super(key: key);
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: 529730141,
        appSign: '09eebeedac491a910433d44e02ed00a525a2316ced7bc8e0c6d5c57006030af8',
        userID: userID,
        userName: 'user_$userID',
        liveID: 'testLiveID',
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}