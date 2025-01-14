import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/app/app_dependency.dart';
import 'package:playground_flutter/managers/app_locale/app_locale.dart';
import 'package:playground_flutter/models/app_config/app_config_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  AppLocale appLocale = appDependency<AppLocale>();

  getAppConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();
    AppConfigModel appConfig =
        AppConfigModel.fromRawJson(remoteConfig.getString('appConfig'));
    String locales = remoteConfig.getString(appConfig.supportedLocales.first);
    appLocale.locale = json.decode(locales);
    emit(state.copyWith(
      status: AppStatus.appLoaded,
      appConfig: appConfig,
    ));
  }

  changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(
      status: AppStatus.appLoaded,
      themeMode: themeMode,
    ));
  }
}

//  _log.warning("Could not get AppConfig data, setting default.", e);
//  emit(state.copyWith(status: AppStatus.loaded));
