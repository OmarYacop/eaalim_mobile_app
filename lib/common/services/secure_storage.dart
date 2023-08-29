import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

// Read value
// String value = await storage.read(key: key);

// Read all values
// Map<String, String> allValues = await storage.readAll();

// Delete value
// await storage.delete(key: key);

// Delete all
// await storage.deleteAll();

// Write value
// await storage.write(key: key, value: value);

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
