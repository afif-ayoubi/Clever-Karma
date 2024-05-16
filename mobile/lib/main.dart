import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/util/location_service.dart';
import 'package:path_provider/path_provider.dart';
import 'core/constants/constants.dart';
import 'features/auth/domain/entities/user.dart';
import 'features/opportunity/core/services/notifications.dart';
import 'injection_container.dart' as di;
import 'main_application.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.instance.initNotifications();
  Directory dir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(UserAdapter());
  FlutterNativeSplash.remove();
  await di.init();
  await LocationService.determinePosition();
  runApp(const MyApp());
}

