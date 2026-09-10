import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static FlutterSecureStorage? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = const FlutterSecureStorage();
  }

  // get instance
  static FlutterSecureStorage? getInstance() {
    return sharedPreferences ?? const FlutterSecureStorage();
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    debugPrint('key: $key value: $value');
    return await sharedPreferences?.write(key: key, value: value);
  }

  static Future<dynamic> getData({required String key}) async {
    var data = await sharedPreferences?.read(key: key);

    return data;
  }

  static Future<void> removeData({required String key}) async {
    return sharedPreferences!.delete(key: key);
  }

  static Future<bool> contains({required String key}) async {
    return await sharedPreferences!.containsKey(key: key);
  }
}
