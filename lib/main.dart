import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_agg/core/utils/sharedprefs.dart';
import 'package:new_agg/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_export.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          //channel.description,
        ),
      ));
}

Future<void> GetDeviceInfo() async {
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.release;
    var sdkInt = androidInfo.version.sdkInt;
    var manufacturer = androidInfo.manufacturer;
    var model = androidInfo.model;
    print('Android $release (SDK $sdkInt), $manufacturer $model');
    // Android 9 (SDK 28), Xiaomi Redmi Note 7
  }

  if (Platform.isIOS) {
    var iosInfo = await DeviceInfoPlugin().iosInfo;
    var systemName = iosInfo.systemName;
    var version = iosInfo.systemVersion;
    var name = iosInfo.name;
    var model = iosInfo.model;
    print('$systemName $version, $name $model');
    // iOS 13.1, iPhone 11 Pro Max iPhone
  }

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo info = await deviceInfo.androidInfo;
  SharedPrefs().brand = info.brand;
  SharedPrefs().model = info.model;
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  var initialzationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initialzationSettingsAndroid);
  //_loadSharedPreference();
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // channel.description,
              icon: android?.smallIcon,
            ),
          ));
    }
  });
  final fcmToken = await FirebaseMessaging.instance.getToken();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("fcm");
  prefs.setString("fcm", fcmToken!);

  //final isAndroid = GetPlatform.isAndroid;
  //final isAndroid = GetPlatform.isAndroid;
  //var token = prefs!.getString('token').toString();
  final fcmlocal = prefs.getString("FCMToken");
  log("FCMToken $fcmToken");
  log("FCMTokenlocal $fcmlocal");
  GetDeviceInfo();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Sedang Rame',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
