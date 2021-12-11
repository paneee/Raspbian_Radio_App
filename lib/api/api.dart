import 'dart:convert';
import 'package:raspbian_radio_app/models/WebRadios.dart';
import 'package:http/http.dart' as http;

String httpPrefix = "http://";

Future<List<WebRadio>> getRadios(String ip, String port) async {
  Uri getAllStationPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/radio/getAllStation/');
  final response = await http.get(getAllStationPath);

  if (response.statusCode == 200) {
    return webRadiosFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<WebRadio> getPlayingStation(String ip, String port) async {
  Uri getPlayingStationPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/radio/getPlayingStation/');
  final response = await http.get(getPlayingStationPath);

  if (response.statusCode == 200) {
    return webRadioFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<double> getVolume(String ip, String port) async {
  Uri getVolumePath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/radio/getVolume/');
  final response = await http.get(getVolumePath);

  if (response.statusCode == 200) {
    return double.parse(response.body);
  } else {
    throw Exception('Failed to get volume');
  }
}

Future<http.Response> setVolume(double volume, String ip, String port) {
  Uri setVolumePath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/radio/setVolume/');
  String _volume = volume.round().toString();
  return http.post(setVolumePath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'volume': _volume,
      }));
}

Future<http.Response> playRadio(WebRadio radio, String ip, String port) {
  Uri playRadioPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/radio/playRadio/');
  return http.post(playRadioPath,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': radio.name!, 'url': radio.url!}));
}

Future<http.Response> stopRadio(String ip, String port) {
  Uri stopRadioPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/radio/stopRadio/');
  return http.post(
    stopRadioPath,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> speakerVolumeUP(String ip, String port) {
  Uri speakerVolumeUPPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/speaker/volumeUp/');

  return http.post(
    speakerVolumeUPPath,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> speakerVolumeDOWN(String ip, String port) {
  Uri speakerVolumeUPPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/speaker/volumeDown/');

  return http.post(
    speakerVolumeUPPath,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

Future<http.Response> speakerVolumeOnOff(String ip, String port) {
  Uri speakerVolumeUPPath =
      Uri.parse(httpPrefix + ip + ':' + port + '/api/speaker/toggle/');

  return http.post(
    speakerVolumeUPPath,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}
