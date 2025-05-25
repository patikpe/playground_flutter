import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class AppLogger {
  static AppLogger? _instance;

  AppLogger._internal();

  factory AppLogger() => _instance ??= AppLogger._internal();

  initLog() async {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    }
    FlutterError.onError =
        (errorDetails) => _logToFirebase(errorDetails, errorDetails.stack);

    PlatformDispatcher.instance.onError = (error, stack) {
      _logToFirebase(error, stack);
      return true;
    };
  }

  void _logToFirebase(dynamic exception, StackTrace? stack) async {
    await FirebaseCrashlytics.instance.recordError(exception, stack);
  }
}
