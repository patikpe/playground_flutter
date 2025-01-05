import 'dart:developer';

import 'package:logging/logging.dart';

class AppLogger {
  static void get instance {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      log('${record.level.name}: ${record.loggerName}: ${record.time}: ${record.message}');
    });
  }
}
