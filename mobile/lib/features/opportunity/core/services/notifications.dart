import 'package:firebase_messaging/firebase_messaging.dart';

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
    if(message ==null) return;
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Firebase token: $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
