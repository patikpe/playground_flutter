import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:playground_flutter/managers/app_management/app_config.dart';
import 'package:playground_flutter/managers/app_management/app_locale/app_locale.dart';
import 'package:playground_flutter/managers/app_management/app_dependency.dart';

class AppRemoteSync {
  static Future<void> sync() async {
    FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
      for (String value in event.updatedKeys) {
        switch (value) {
          case 'appConfig':
            AppConfig.forceAppConfigUpdate();
          default:
            // Default case to update locale
            if (value.contains('_')) {
              await appDependency<AppLocale>().forceLocaleUpdate(value);
            }
        }
      }
    });
  }
}
