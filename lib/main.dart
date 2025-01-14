import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:playground_flutter/app/app.dart';
import 'package:playground_flutter/app/app_dependency.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppDependency();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
