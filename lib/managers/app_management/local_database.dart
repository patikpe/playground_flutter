import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabase {
  late Database _db;
  late StoreRef _store;

  LocalDatabase() {
    _initLocalDatabase().then((db) {
      _db = db;
      _store = StoreRef.main();
    });
  }

  static Future<Database> _initLocalDatabase() async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    await appDocumentsDirectory.create(recursive: true);
    String dbPath = join(appDocumentsDirectory.path, 'local_database.db');
    return await databaseFactoryIo.openDatabase(
      dbPath,
      // codec: SembastCodec(
      //   signature: '', //Add signature name
      //   codec: MyAsyncCodec(),
      // ),
    );
  }

  Future<bool> recordExistsAndNotEmpty(String key) async =>
      (await _store.record(key).exists(_db) &&
          await _store.record(key).get(_db) != null);

  Future<Object?> delete(String key) async =>
      await _store.record(key).delete(_db);

  Future<Map<String, dynamic>> get(String key) async =>
      await _store.record(key).get(_db) as Map<String, dynamic>;

  Future<Map<String, dynamic>> update(
          String key, Map<String, dynamic> data) async =>
      await _store.record(key).put(_db, data) as Map<String, dynamic>;
}

class MyAsyncCodec extends AsyncContentCodecBase {
  final IV iv = IV.fromUtf8(''); // Add 8 string
  final Encrypter encrypter =
      Encrypter(Salsa20(Key.fromUtf8(''))); // Add 32 string

  @override
  Future<Object?> decodeAsync(String encoded) async {
    return jsonDecode(encrypter.decrypt64(encoded, iv: iv));
  }

  @override
  Future<String> encodeAsync(Object? input) async {
    return encrypter.encrypt(jsonEncode(input), iv: iv).base64;
  }
}
