import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/core/app/app_config.dart';
import 'package:playground_flutter/core/app_dependency.dart';
import 'package:playground_flutter/core/locale/app_locale.dart';
import 'package:playground_flutter/models/app_config/app_config_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  getAppConfig() async {
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await remoteConfig.fetchAndActivate();
      AppConfigModel appConfig = await AppConfig.getStartUpAppConfig();
      await appDependency<AppLocale>()
          .getStartUpDeviceLocale(appConfig.supportedLocales);
      remoteConfigSync();
      emit(state.copyWith(
        status: AppStatus.appLoaded,
        appConfig: appConfig,
      ));
    } on Exception catch (e) {
      //add logging
      emit(state.copyWith(
        status: AppStatus.appLoadingError,
      ));
    }
  }

  changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(
      status: AppStatus.appLoaded,
      themeMode: themeMode,
    ));
  }

  remoteConfigSync() {
    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.fetchAndActivate();
      for (String value in event.updatedKeys) {
        switch (value) {
          case 'appConfig':
            AppConfigModel appConfig = await AppConfig.forceAppConfigUpdate();
            emit(state.copyWith(
              status: AppStatus.appLoaded,
              appConfig: appConfig,
            ));
          default:
            // Default case to update locale
            if (value.contains('_')) {
              await appDependency<AppLocale>().forceLocaleUpdate(value);
              emit(state.copyWith(
                status: AppStatus.appLoaded,
              ));
            }
        }
      }
    });
  }
}

//  _log.warning("Could not get AppConfig data, setting default.", e);
//  emit(state.copyWith(status: AppStatus.loaded));
