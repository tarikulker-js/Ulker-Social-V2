import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  // Veri ekleme
  Future<void> write(String key, String value) async {
    print(value);
    print(key);
    await _storage.write(key: key, value: value);
  }

  // Veri okuma
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Veri silme
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}
