import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LiveStreaming extends StatelessWidget {
  const LiveStreaming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>JumpToLivePage(context, isHost: true),
            child: Text(
              'Start Live Streaming',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: ()=> JumpToLivePage(context, isHost: false),
            child: Text(
              'Join Live Streaming',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );

  }
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
