import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

import '../../../opportunity/core/constants/keys.dart';

class LiveStreaming extends StatelessWidget {
  const LiveStreaming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // ElevatedButton(
          //   onPressed: () => JumpToLivePage(context, isHost: false),
          //   child: Text(
          //     'Join Live Streaming',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}

JumpToLivePage(
    {required BuildContext context,
    required bool isHost,
    required String username,
    required String liveId,
    required String userID}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LivePage(
        isHost: isHost,
        username: username,
        liveId: liveId,
        userID: userID,
      ),
    ),
  );
}
// final String userID = Random().nextInt(10000).toString();

class LivePage extends StatelessWidget {
  const LivePage(
      {Key? key,
      this.isHost = false,
      required this.username,
      required this.liveId,
      required this.userID})
      : super(key: key);
  final bool isHost;
  final String username;
  final String liveId;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: 529730141,
        appSign: APP_SIGN,
        userID: userID,
        userName: username,
        liveID: liveId,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
