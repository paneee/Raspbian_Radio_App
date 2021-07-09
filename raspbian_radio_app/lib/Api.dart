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

// Future<void> createAlbum(double volume) async {
//   String _volume = volume.round().toString();
//   final response = await http.post(
//     Uri.parse('http://192.168.1.50:8080/api/setVolume/'),
//     //Uri.parse('http://192.168.1.2:3000/content/'),
//     headers: <String, String>{
//       "Content-Type": "application/json; charset=utf-8",
//       "Access-Control-Allow-Origin": "*",
//       "Access-Control-Allow-Headers":
//           "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//       "Access-Control-Allow-Methods": "GET,POST,PUT,PATCH,DELETE,HEAD,OPTIONS"
//     },

//     body: jsonEncode(<String, String>{
//       'volume': _volume,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     //return Album.fromJson(jsonDecode(response.body));
//     var kk = response.body;
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }

// Future<void> createAlbum2(String title) async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     var kk = jsonDecode(response.body);
//     int jjj = 99;
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }



// set volume

// get station

// play station

// stop station  
