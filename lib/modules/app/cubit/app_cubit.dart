import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/managers/app_management/local_database.dart';
import 'package:playground_flutter/managers/app_management/app_dependency.dart';
import 'package:playground_flutter/managers/app_management/app_locale/app_locale.dart';
import 'package:playground_flutter/models/app_config/app_config_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  getAppConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();

    AppConfigModel appConfig =
        AppConfigModel.fromRawJson(remoteConfig.getString('appConfig'));
    await appDependency<LocalDatabase>()
        .update('appConfig', appConfig.toJson());
    await appDependency<AppLocale>()
        .getStartUpDeviceLocale(appConfig.supportedLocales);
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
