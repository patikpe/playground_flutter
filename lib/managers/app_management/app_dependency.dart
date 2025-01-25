// Dependency Injection
import 'package:get_it/get_it.dart';
import 'package:playground_flutter/managers/app_management/app_locale/app_locale.dart';
import 'package:playground_flutter/managers/app_management/local_database.dart';

final GetIt appDependency = GetIt.instance;

void setupAppDependency() {
  appDependency.registerSingleton<AppLocale>(AppLocale());
  appDependency.registerSingleton<LocalDatabase>(LocalDatabase());
}
