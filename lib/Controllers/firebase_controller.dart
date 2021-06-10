import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:http/http.dart' as http;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channelHigh = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notification',
  'This channel is used for important notifications',
  importance: Importance.high,
  enableVibration: true,
  enableLights: true,
  playSound: true,
  showBadge: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<String> _downloadAndSaveFile(String url, String fileName) async {
  try {
    if (url.length < 1) {
      return '';
    }
  } catch (e) {
    print('url length < 1');
    return '';
  }
  final Directory directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/$fileName';
  final http.Response response = await http.get(Uri.parse(url));
  final File file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

// Future<void> _showBigPictureNotification(RemoteMessage message) async {
//   final NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//       message.notification.hashCode,
//       message.notification.title,
//       message.notification.body,
//       platformChannelSpecifics);
// }

class FirebaseController extends GetxController {
  @override
  onInit() async {
    await _connectToFirebase();
    _getToken();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channelHigh);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        final String largeIconPath = await _downloadAndSaveFile(
            message.notification.android.imageUrl, 'largeIcon');
        final String bigPicturePath = await _downloadAndSaveFile(
            message.notification.android.imageUrl, 'bigPicture');

        final BigPictureStyleInformation bigPictureStyleInformation =
            BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath));

        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: bigPicturePath.length > 0
                ? AndroidNotificationDetails(
                    channelHigh.id,
                    channelHigh.name,
                    channelHigh.description,
                    // TODO add a proper drawable resource to android, for now using one that already exists in example app.
                    icon: 'launch_background',
                    styleInformation: bigPictureStyleInformation,
                  )
                : AndroidNotificationDetails(
                    channelHigh.id,
                    channelHigh.name,
                    channelHigh.description,
                    // TODO add a proper drawable resource to android, for now using one that already exists in example app.
                    icon: 'launch_background',
                  ),
          ),
        );
      }
    });
    super.onInit();
  }

  _connectToFirebase() async {
    await Firebase.initializeApp();
  }

  _getToken() async {
    String token = await FirebaseMessaging.instance.getToken();
    print(token);
  }
}
