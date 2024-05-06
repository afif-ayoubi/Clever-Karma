import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/opportunity/core/external_api/notifications.dart';
import 'injection_container.dart' as di;
import 'main_application.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi.instance.initNotifications();
  await di.init();
  runApp(const MyApp());
}
