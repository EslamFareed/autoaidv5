import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> login(String id, Map<String, dynamic> data) async {
    await prefs.setBool("isLogin", true);
    await prefs.setString("userId", id);
    await prefs.setString("data", jsonEncode(data));
  }

  static Future<void> logout() async {
    await prefs.remove("isLogin");
    await prefs.remove("userId");
    await prefs.remove("data");
  }

  static Future<void> setHaveRequest(String id) async {
    await prefs.setString("request", id);
  }

  
  static Future<void> deleteRequest() async {
    await prefs.remove("request");
  }

  static String? getHaveRequest() => prefs.getString("request");

  static bool isLogin() => prefs.getBool("isLogin") ?? false;
  static Map<String, dynamic> getUser() =>
      jsonDecode(prefs.getString("data") ?? "");
  static String getUserId() => prefs.getString("userId") ?? "";
}
