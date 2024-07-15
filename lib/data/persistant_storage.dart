import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PersistantStorage {
  static const String _userKey = 'user';
  static const String _infoKey = 'info';

  static Future<void> storeUserAndPass(String name, String pwd) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('$_userKey-$name', pwd);
  }

  static Future<void> storeUserAndInfo(String name, List<String> info) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('$_infoKey-$name', info);
  }

  static Future<Map<String, String>?> getUserCredsIfExist(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final pwd = prefs.getString('$_userKey-$name');
    if (pwd == null) {
      return null;
    }
    return {name: pwd};
  }

  static Future<Map<String, String>?> getUserAndInfo(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final info = prefs.getStringList('$_infoKey-$name');
    if (info == null) {
      return null;
    }
    final map = <String, String>{};
    for (int i = 0; i < info.length; i += 2) {
      map[info[i]] = info[i + 1];
    }
    return map;
  }
}
