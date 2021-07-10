import 'dart:convert';
import 'package:raspbian_radio_app/WebRadios.dart';
import 'package:http/http.dart' as http;

String ip = 'http://' + "192.168.1.50";
String port = "5000";
Uri getAllStationPath = Uri.parse(ip + ':' + port + '/api/getAllStation/');
Uri getVolumePath = Uri.parse(ip + ':' + port + '/api/getVolume/');
Uri setVolumePath = Uri.parse(ip + ':' + port + '/api/setVolume/');
Uri playRadioPath = Uri.parse(ip + ':' + port + '/api/playRadio/');
Uri stopRadioPath = Uri.parse(ip + ':' + port + '/api/stopRadio/');
Uri getPlayingStationPath =
    Uri.parse(ip + ':' + port + '/api/getPlayingStation/');

Future<List<WebRadio>> getRadios() async {
  final response = await http.get(getAllStationPath);

  if (response.statusCode == 200) {
    return webRadiosFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<WebRadio> getPlayingStation() async {
  final response = await http.get(getPlayingStationPath);

  if (response.statusCode == 200) {
    return webRadioFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<double> getVolume() async {
  final response = await http.get(getVolumePath);

  if (response.statusCode == 200) {
    return double.parse(response.body);
  } else {
    throw Exception('Failed to get volume');
  }
}

Future<http.Response> setVolume(double volume) {
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
  return http.post(playRadioPath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': radio.name!, 'url': radio.url!}));
}

Future<http.Response> stopRadio() {
  return http.post(
    stopRadioPath,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
