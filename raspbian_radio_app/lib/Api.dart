import 'dart:convert';

import 'package:raspbian_radio_app/WebRadios.dart';
import 'package:http/http.dart' as http;

Future<List<WebRadio>> getRadios() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.50:8080/api/getAllStation2'));

  if (response.statusCode == 200) {
    return webRadiosFromJson(response.body);
  } else {
    throw Exception('Failed to get radios');
  }
}

Future<double> getVolume() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.50:8080/api/getVolume'));

  if (response.statusCode == 200) {
    return double.parse(response.body);
  } else {
    throw Exception('Failed to get volume');
  }
}

Future<http.Response> setVolume(double volume) {
  String _volume = volume.round().toString();
  return http.post(Uri.parse('http://192.168.1.50:8080/api/setVolume/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'volume': _volume,
      }));
}

Future<http.Response> playRadio(WebRadio radio) {
  return http.post(Uri.parse('http://192.168.1.50:8080/api/playRadio/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'name': radio.name!, 'url': radio.url!}));
}

Future<http.Response> stopRadio() {
  return http.post(
    Uri.parse('http://192.168.1.50:8080/api/stopRadio/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}


// get station

// play station

// stop station  
