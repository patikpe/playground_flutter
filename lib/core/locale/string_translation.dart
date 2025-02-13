import 'package:playground_flutter/core/locale/app_locale.dart';

extension StringTranslation on String {
  String get translate => AppLocale().localeStrings[this] ?? this;
}
