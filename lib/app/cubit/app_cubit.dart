import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:playground_flutter/models/app_config_model.dart';

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
    String appName = remoteConfig.getString('appConfig');

    print(appName);

    // emit(state.copyWith(
    //     status: AppStatus.appLoaded,
    //     appConfig: AppConfigModel(
    //         appName: 'Playground Flutter', mainColor: '#FF0000')));
  }
}
