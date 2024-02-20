import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:repair/Home.dart';
import 'package:repair/Login.dart';
import 'package:repair/Navigation.dart';
import 'package:repair/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('fcmToken is :' '$fcmToken');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackground);
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
