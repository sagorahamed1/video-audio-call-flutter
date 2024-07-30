import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video & Audio Call',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}



class HomeScreen extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _callIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video and Audio Call'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userNameController,
              decoration: const InputDecoration(labelText: 'Enter your username'),
            ),
            TextField(
              controller: _callIdController,
              decoration: const InputDecoration(labelText: 'Enter call ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sendCallButton(
                      isVideoCall: false,
                      name: _userNameController.text,
                      onCallFinished: onSendCallInvitationFinished,
                      inviteUserId: '$_callIdController',
                    ),
                  ),
                );
              },
              child: const Text('Start Call'),
            ),
          ],
        ),
      ),
    );
  }
}



sendCallButton({
  required bool isVideoCall,
  required String inviteUserId,
  required String name,
  void Function(String code, String message, List<String>)? onCallFinished,
}){
  return ZegoSendCallInvitationButton(
    isVideoCall: isVideoCall,
    invitees: [
      ZegoUIKitUser(
        id: inviteUserId,
        name: name,
      )
    ],
    resourceID: "zego_call",
    icon: ButtonIcon(
        icon: isVideoCall ? const Icon(Icons.video_call) : const Icon(Icons.audiotrack)

    ),
    iconSize: const Size(30, 30),
    buttonSize: const Size(40, 40),
    onPressed: onCallFinished,
  );
}


void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
    ) {
  if (errorInvitees.isNotEmpty) {
    String userIDs = "";
    for (int index = 0; index < errorInvitees.length; index++) {
      if (index >= 5) {
        userIDs += '... ';
        break;
      }

      var userID = errorInvitees.elementAt(index);
      userIDs += userID + ' ';
    }
    if (userIDs.isNotEmpty) {
      userIDs = userIDs.substring(0, userIDs.length - 1);
    }

    var message = 'User doesn\'t exist or is offline: $userIDs';
    if (code.isNotEmpty) {
      message += ', code: $code, message:$message';
    }
    // showToast(
    //   message,
    //   position: StyledToastPosition.top,
    //   context: context,
    // );
  } else if (code.isNotEmpty) {
    // showToast(
    //   'code: $code, message:$message',
    //   position: StyledToastPosition.top,
    //   context: context,
    // );

  }
}


