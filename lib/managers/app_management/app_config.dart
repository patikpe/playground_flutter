import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:playground_flutter/managers/app_management/app_dependency.dart';
import 'package:playground_flutter/managers/app_management/local_database.dart';
import 'package:playground_flutter/models/app_config/app_config_model.dart';

class AppConfig {
  static Future<AppConfigModel> getStartUpAppConfig() async {
    return await getAppConfig();
  }

  static Future<AppConfigModel> forceAppConfigUpdate() async {
    return await _getRemoteAppConfig();
  }

  static Future<AppConfigModel> getAppConfig() async {
    if (await appDependency<LocalDatabase>()
        .recordExistsAndNotEmpty('appConfig')) {
      return AppConfigModel.fromJson(
          await appDependency<LocalDatabase>().get('appConfig'));
    } else {
      return _getRemoteAppConfig();
    }
  }

  static Future<AppConfigModel> _getRemoteAppConfig() async {
    AppConfigModel appConfig = AppConfigModel.fromRawJson(
        FirebaseRemoteConfig.instance.getString('appConfig'));
    await appDependency<LocalDatabase>()
        .update('appConfig', appConfig.toJson());
    return appConfig;
  }
}
