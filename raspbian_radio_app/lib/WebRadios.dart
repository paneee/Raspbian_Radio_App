import 'dart:convert';

class WebRadio {
  String? name;
  String? url;
  bool? isPlaying;

  WebRadio({
    required this.name,
    required this.url,
    required this.isPlaying,
  });

  factory WebRadio.fromJson(Map<String, dynamic> json) {
    return WebRadio(
        name: json['name'], url: json['url'], isPlaying: json['isPlaying']);
  }
}

List<WebRadio> webRadiosFromJson(String str) =>
    List<WebRadio>.from(json.decode(str).map((x) => WebRadio.fromJson(x)));

WebRadio webRadioFromJson(String str) => WebRadio.fromJson(json.decode(str));
