import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<String> getIp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ip') ?? '192.168.1.50';
  }

  static Future<String> getPort() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('port') ?? '5000';
  }
}
