import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class FirebaseMessage {
  final firebaseMessaging = FirebaseMessaging.instance;
  final controllerTopic = TextEditingController();
  bool isSubscribed = false;
  String token = '';
  static String dataName = '';
  static String dataAge = '';

  void _configureFCMListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming data message when the app is in the foreground
      print("Data message received: ${message.data}");
      // Extract data and perform custom actions
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle incoming data message when the app is in the background or terminated
      print("Data message opened: ${message.data}");
      // Extract data and perform custom actions
    });
  }

  Future<void> _backgroundHandler(RemoteMessage message) async {
    print("Handling background message: ${message.data}");
    // Process the incoming message and perform appropriate actions
  }

  void _initializeFCM() {
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.getToken().then((token) {
      print("FCM Token: $token");
      // Store the token on your server for sending targeted messages
    });
  }
/*
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    //setState(() {
    //  token = token;
    // });
    print(token);
  }
*/
}
