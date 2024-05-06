import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/class_routes.dart';

import '../../../../routes/app_routes.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class NotificationService {
  NotificationService._privateConstructor();

  static final NotificationService _instance = NotificationService._privateConstructor();

  static NotificationService get instance => _instance;

  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notifications",
      description: "This channel is used for important notifications",
      importance: Importance.high);
  final _localNotifications = FlutterLocalNotificationsPlugin();

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
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(notification.hashCode, notification.title,
          notification.body, const NotificationDetails());
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Firebase token: $fcmToken');
    initPushNotifications();
  }

  notificationDetail() {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: _androidChannel.importance,
      icon: '@mipmap/ic_launcher',
    ));
  }
}
