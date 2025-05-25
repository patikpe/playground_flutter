import 'package:tekio_app/core/locale/app_locale.dart';

extension StringTranslation on String {
  String get translate => AppLocale().localeStrings[this] ?? this;
}
