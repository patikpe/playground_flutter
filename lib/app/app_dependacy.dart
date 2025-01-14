// Dependency Injection
import 'package:get_it/get_it.dart';
import 'package:playground_flutter/managers/app_locale/app_locale.dart';

final appDependency = GetIt.instance;

void setupAppDependency() {
  appDependency.registerSingleton<AppLocale>(AppLocale());
}
