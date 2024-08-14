import 'package:flutter/material.dart';
import 'package:video_audio_call_flutter/config/config.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallInvitation extends StatelessWidget {
  final Widget child;
  final String userName;
   CallInvitation({super.key, required this.child, required this.userName});

  @override
  Widget build(BuildContext context) {
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: Config.appId,
      appSign: Config.appSign,
      userID: userName,
      userName: userName,
      plugins: [ZegoUIKitSignalingPlugin()],
    );
    return child;
  }
}
