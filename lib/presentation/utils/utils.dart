import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/router_imports.gr.dart';

class Utils {
  static Future<void> manipulationLogin(context) async {
    var token = await getToken();
    if (token != null) {
      AutoRouter.of(context).push(const HomeRoute());
    } else {
      AutoRouter.of(context).push(const AuthRoute());
    }
  }

  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<void> clearAllSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
