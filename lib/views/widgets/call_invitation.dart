import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallInvitation extends StatelessWidget {
  final Widget child;
  final String userName;
  const CallInvitation({super.key, required this.child, required this.userName});

  @override
  Widget build(BuildContext context) {
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: 752493796,
      appSign: '48658a3e1cc267916153e4fdb37fd6dfaf2b3ba78fd1f6e81b16b6b64ebde6f0',
      userID: userName,
      userName: userName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
    return child;
  }
}
