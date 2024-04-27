import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'main_application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
