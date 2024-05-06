import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';

import '../../../../routes/app_routes.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  FirebaseApi._privateConstructor();

  static final FirebaseApi _instance = FirebaseApi._privateConstructor();

  static FirebaseApi get instance => _instance;

  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentContext!.go(Routes.entryPage);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Firebase token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
