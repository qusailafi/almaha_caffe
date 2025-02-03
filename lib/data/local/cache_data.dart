import 'package:shared_preferences/shared_preferences.dart';

class CacheDataManager {
  // Fetch a string value
  static Future<String> getStringData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? ""; // Use null-coalescing operator
  }

  // Fetch a boolean value
  static Future<bool> getBoolean(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false; // Use null-coalescing operator
  }

  // Save a string value
  static Future<void> putStringData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Clear all data
  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Save a boolean value
  static Future<void> putBooleanData(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }
}
