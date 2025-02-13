import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/core/app/app_config.dart';
import 'package:playground_flutter/core/locale/app_locale.dart';
import 'package:playground_flutter/models/app_config/app_config_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  getAppConfig() async {
    try {
      AppConfigModel appConfig = await AppConfig.getStartUpAppConfig();
      await AppLocale().getStartUpDeviceLocale(appConfig.supportedLocales);
      remoteConfigSync();
      emit(state.copyWith(
        status: AppStatus.appLoaded,
        appConfig: appConfig,
      ));
    } on Exception catch (e) {
      log(e.toString());
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
    FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
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
              await AppLocale().forceLocaleUpdate(value);
              emit(state.copyWith(
                status: AppStatus.appLoaded,
              ));
            }
        }
      }
    });
  }
}
