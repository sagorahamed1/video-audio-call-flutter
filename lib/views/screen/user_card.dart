import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:video_audio_call_flutter/services/firebase_services.dart';

class UserCard extends StatelessWidget {
  final UserModel userModel;

  const UserCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 24,
            child: Text(
              userModel.name.substring(0, 1).toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(userModel.userName),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
              width: 30,
              child: actionButton(context, false)),
          const SizedBox(width: 20),
          SizedBox(
              width: 30,
              child: actionButton(context, true)),
        ],
      ),
    );
  }

  ZegoSendCallInvitationButton actionButton(BuildContext context, bool isVideo) {
    return ZegoSendCallInvitationButton(

      invitees: [
        ZegoUIKitUser(
          id: userModel.email,
          name: userModel.email,
        )
      ],
      resourceID: 'zegouikit_call',
      isVideoCall: isVideo,
    );
  }
}
