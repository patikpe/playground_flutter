import 'package:playground_flutter/core/app_dependency.dart';
import 'package:playground_flutter/core/locale/app_locale.dart';

extension StringTranslation on String {
  String get translate =>
      appDependency<AppLocale>().localeStrings[this] ?? this;
}
