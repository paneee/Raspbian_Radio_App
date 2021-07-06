import 'package:raspbian_radio_app/WebRadios.dart';
import 'package:http/http.dart' as http;

Future<List<WebRadio>> getRadios() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.50:8080/api/getAllStation2'));

  if (response.statusCode == 200) {
    print(response.body);
    return webRadiosFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load radios');
  }
}
