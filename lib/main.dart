import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:playground_flutter/core/database/local_database.dart';
import 'package:playground_flutter/core/logger/app_logger.dart';
import 'package:playground_flutter/features/app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB().initLocalDatabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppLogger().initLog();
  runApp(const MainApp());
}
