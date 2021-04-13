import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static Future<SharedPreferences> instance() async {
    return await SharedPreferences.getInstance();
  }

  static Future<String> getUser() async {
    final pref = await instance();
    return pref.getString('user') ?? '';
  }

  static setUser(String user) async {
    final pref = await instance();
    pref.setString('user', user);
  }

  static Future<String> getUsername() async {
    final pref = await instance();
    return pref.getString('username') ?? '';
  }

  static setUsername(String user) async {
    final pref = await instance();
    pref.setString('username', user);
  }

  static Future<String> getPassword() async {
    final pref = await instance();
    return pref.getString('password') ?? '';
  }

  static setPassword(String password) async {
    final pref = await instance();
    pref.setString('password', password);
  }

  static Future<String> getToken() async {
    final pref = await instance();
    return pref.getString('token') ?? '';
  }

  static setToken(String token) async {
    final pref = await instance();
    pref.setString('token', token);
  }

  static Future<int> getDeviceSum() async {
    final pref = await instance();
    return pref.getInt('device_sum') ?? 0;
  }

  static setDeviceSum(int deviceSum) async {
    final pref = await instance();
    pref.setInt('device_sum', deviceSum);
  }

  static Future<Map<String, dynamic>> getNameMap() async {
    final pref = await instance();
    return jsonDecode(pref.getString('name_map') ?? '{}');
  }

  static setNameMap(Map<String, dynamic> nameMap) async {
    final pref = await instance();
    pref.setString('name_map', jsonEncode(nameMap));
  }

  static clearAll() async {
    await setDeviceSum(0);
    await setUser('');
    await setUsername('');
    await setPassword('');
    await setToken('');
  }
}
