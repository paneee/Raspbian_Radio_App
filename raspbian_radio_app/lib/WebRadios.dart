import 'dart:convert';

class WebRadio {
  String name;
  String url;

  WebRadio({
    required this.name,
    required this.url,
  });

  factory WebRadio.fromJson(Map<String, dynamic> json) {
    return WebRadio(
      name: json['name'],
      url: json['url'],
    );
  }
}

List<WebRadio> webRadiosFromJson(String str) =>
    List<WebRadio>.from(json.decode(str).map((x) => WebRadio.fromJson(x)));
