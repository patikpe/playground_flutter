import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class DB {
  static DB? _instance;
  late Database _db;
  final StoreRef _store = StoreRef.main();

  DB._internal();

  factory DB() => _instance ??= DB._internal();

  Future<void> initLocalDatabase() async {
    final Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    await appDocumentsDirectory.create(recursive: true);
    String dbPath = join(appDocumentsDirectory.path, 'local_database.db');
    _db = await databaseFactoryIo.openDatabase(
      dbPath,
      codec: SembastCodec(
        signature: 'localDatabase',
        codec: MyAsyncCodec(),
      ),
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
  final IV _iv = IV.fromUtf8('hX2dRlLi');
  final Encrypter _encrypter =
      Encrypter(Salsa20(Key.fromUtf8('mcVogGo5m0KD1y3FaWVi8PbrEikL7vip')));

  @override
  Future<Object?> decodeAsync(String encoded) async {
    return jsonDecode(_encrypter.decrypt64(encoded, iv: _iv));
  }

  @override
  Future<String> encodeAsync(Object? input) async {
    return _encrypter.encrypt(jsonEncode(input), iv: _iv).base64;
  }
}
