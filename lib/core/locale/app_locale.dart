import 'dart:convert';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:playground_flutter/core/database/local_database.dart';

class AppLocale {
  static AppLocale? _instance;
  Map<String, dynamic> localeStrings = {};

  AppLocale._internal();

  factory AppLocale() => _instance ??= AppLocale._internal();

  Future<void> getStartUpDeviceLocale(List<String> supportedLocales) async {
    String defaultLocale = Platform.localeName;
    if (!supportedLocales.contains(defaultLocale)) {
      defaultLocale = 'en_US';
    }
    localeStrings = await _getLocale(defaultLocale);
  }

  Future<void> changeLocale(String localeCode) async {
    localeStrings = await _getLocale(localeCode);
  }

  Future<void> forceLocaleUpdate(String localeCode) async {
    localeStrings = await _getRemoteLocale(localeCode);
  }

  Future<Map<String, dynamic>> _getLocale(String localeCode) async {
    if (await DB().recordExistsAndNotEmpty(localeCode)) {
      return await DB().get(localeCode);
    } else {
      return _getRemoteLocale(localeCode);
    }
  }

  Future<Map<String, dynamic>> _getRemoteLocale(String localeCode) async {
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    String locales = FirebaseRemoteConfig.instance.getString(localeCode);
    return await DB().update(localeCode, json.decode(locales));
  }
}
