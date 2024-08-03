import 'package:flutter/material.dart';
import 'package:video_audio_call_flutter/services/firebase_services.dart';
import 'package:video_audio_call_flutter/views/screen/homeScreen.dart';
import 'package:video_audio_call_flutter/views/screen/log_in_screen.dart';
import 'package:video_audio_call_flutter/views/screen/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices.setUpFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Audio Call Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen(),
      routes: {
        '/login': (context) => LogInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
