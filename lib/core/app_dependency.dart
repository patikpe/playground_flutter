// Dependency Injection
import 'package:playground_flutter/core/database/local_database.dart';

Future<void> startDependencies() async {
  return await DB().initLocalDatabase();
}
