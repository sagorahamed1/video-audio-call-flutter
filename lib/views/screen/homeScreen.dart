import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:video_audio_call_flutter/services/firebase_services.dart';
import 'package:video_audio_call_flutter/views/screen/user_card.dart';
import 'package:video_audio_call_flutter/views/widgets/call_invitation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${FirebaseServices.currentUser.name}'),
      ),
      body: FirebaseServices.currentUser.name == ''
          ? Center(
        child: Text('User not logged in. Please log in.'),
      )
          : CallInvitation(
        userName: FirebaseServices.currentUser.email,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseServices().buildViews,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final docs = snapshot.data?.docs;
                    if (docs == null || docs.isEmpty) {
                      return const Center(child: Text("No Data"));
                    }
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        var data = docs[index];
                        var user = UserModel.fromJson(data.data() as Map<String, dynamic>);
                        return UserCard(userModel: user);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
