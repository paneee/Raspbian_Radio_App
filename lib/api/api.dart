import 'dart:convert';
import 'package:raspbian_radio_app/utils/Preferences.dart';
import 'package:raspbian_radio_app/models/WebRadios.dart';
import 'package:http/http.dart' as http;

String? ip;
String? port;
String? httpPrefix = "http://";

void refreshPreferences() {
  ip = SharedPreferencesHelper.getIp() as String?;
  port = SharedPreferencesHelper.getPort() as String?;
  print(ip);
  print(port);
}

Uri getAllStationPath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/getAllStation/');
Uri getStatusPath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/getStatus/');
Uri getVolumePath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/getVolume/');
Uri setVolumePath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/setVolume/');
Uri playRadioPath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/playRadio/');
Uri stopRadioPath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/stopRadio/');
Uri getPlayingStationPath =
    Uri.parse(httpPrefix! + ip! + ':' + port! + '/api/getPlayingStation/');

Future<List<WebRadio>> getRadios() async {
  refreshPreferences();
  var test = httpPrefix! + ip! + ':' + port! + '/api/getAllStation/';
  print(test);
  final response = await http.get(getAllStationPath);

  if (response.statusCode == 200) {
    return webRadiosFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<WebRadio> getPlayingStation() async {
  refreshPreferences();
  final response = await http.get(getPlayingStationPath);

  if (response.statusCode == 200) {
    return webRadioFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<double> getVolume() async {
  refreshPreferences();
  final response = await http.get(getVolumePath);

  if (response.statusCode == 200) {
    return double.parse(response.body);
  } else {
    throw Exception('Failed to get volume');
  }
}

Future<http.Response> setVolume(double volume) {
  refreshPreferences();
  String _volume = volume.round().toString();
  return http.post(setVolumePath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'volume': _volume,
      }));
}

Future<http.Response> playRadio(WebRadio radio) {
  refreshPreferences();
  return http.post(playRadioPath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': radio.name!, 'url': radio.url!}));
}

Future<http.Response> stopRadio() {
  refreshPreferences();
  return http.post(
    stopRadioPath,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
