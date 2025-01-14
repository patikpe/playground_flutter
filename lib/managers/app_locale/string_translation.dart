import 'package:playground_flutter/managers/app_management/app_dependency.dart';
import 'package:playground_flutter/managers/app_locale/app_locale.dart';

extension StringTranslation on String {
  String get translate {
    AppLocale appLocale = appDependency<AppLocale>();
    return appLocale.localeStrings[this];
  }
}
