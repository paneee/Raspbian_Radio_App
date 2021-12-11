import 'package:raspbian_radio_app/models/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<Settings> getSettings() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Settings settings = new Settings(
        ip: preferences.getString('ip') ?? '10.147.17.2',
        radioPort: preferences.getString('radioPort') ?? '5001',
        speakerPort: preferences.getString('speakerPort') ?? '5002',
        color: preferences.getString('color') ?? 'Blue');
    return settings;
  }
}
