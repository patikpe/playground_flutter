import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:playground_flutter/modules/app/app.dart';
import 'package:playground_flutter/managers/app_management/app_dependency.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppDependency();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
