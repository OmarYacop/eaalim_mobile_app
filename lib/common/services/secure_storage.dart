import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static void saveVariable(String key, value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> loadVariable(String key) async {
    return await storage.read(key: key); //returns string
  }

  static Future<void> deleteVariable(String key) async {
    await storage.delete(key: key);
  }
}
