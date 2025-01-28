// Dependency Injection
import 'package:get_it/get_it.dart';
import 'package:playground_flutter/core/locale/app_locale.dart';
import 'package:playground_flutter/core/database/local_database.dart';

final GetIt appDependency = GetIt.instance;

void setupAppDependency() {
  appDependency.registerSingleton<AppLocale>(AppLocale());
  appDependency.registerSingleton<LocalDatabase>(LocalDatabase());
}
