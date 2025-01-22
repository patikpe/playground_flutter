import 'dart:convert';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:playground_flutter/managers/app_database/local_database.dart';
import 'package:playground_flutter/managers/app_management/app_dependency.dart';

class AppLocale {
  Map<String, dynamic> localeStrings = {};

  Future<void> changeLocale(String localeCode) async {
    localeStrings = await appDependency<LocalDatabase>().get(localeCode);
  }

  Future<void> getInitialDeviceLocale(List<String> supportedLocales) async {
    String defaultLocale = Platform.localeName;
    if (!supportedLocales.contains(defaultLocale)) {
      defaultLocale = 'en_US';
    }
    String locales = FirebaseRemoteConfig.instance.getString(defaultLocale);
    localeStrings = json.decode(locales);
    await appDependency<LocalDatabase>().update(defaultLocale, localeStrings);
  }

  downloadMissingLocalesOnBackground(List<String> supportedLocales) {}
}
