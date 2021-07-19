import 'package:raspbian_radio_app/models/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<Settings> getSettings() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Settings settings = new Settings(
        ip: preferences.getString('ip') ?? '192.168.1.50',
        port: preferences.getString('port') ?? '5000',
        color: preferences.getString('color') ?? 'Blue');
    return settings;
  }
}
