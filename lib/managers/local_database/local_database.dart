import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabase {
  static Future initLocalDatabase() async {
    try {
      if (kIsWeb) {
        return;
      } else {
        final Directory appDocumentsDirectory =
            await getApplicationDocumentsDirectory();
        await appDocumentsDirectory.create(recursive: true);
        var dbPath = join(appDocumentsDirectory.path, 'local_database.db');
        await databaseFactoryIo.openDatabase(dbPath);
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
