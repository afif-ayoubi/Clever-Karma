import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/opportunity/core/services/notifications.dart';
import 'injection_container.dart' as di;
import 'main_application.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.instance.initNotifications();
  FlutterNativeSplash.remove();

  await di.init();
  runApp(const MyApp());
}
