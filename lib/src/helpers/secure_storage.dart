import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = new FlutterSecureStorage();

  Future<String> getSecureStorageKey(key) async {
    return await storage.read(key: key);
  }

  Future<Map<String, String>> readAllSecureStorage() async {
    return await storage.readAll();
  }

  Future<void> deleteFromStorage(key) async {
    return await storage.delete(key: key);
  }

  Future<void> deletAllSecureStorage() async {
    return await storage.deleteAll();
  }

  Future<void> writeSecureStorage(key, value) async {
    return await storage.write(key: key, value: value);
  }
}
