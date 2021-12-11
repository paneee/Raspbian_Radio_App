import 'dart:convert';

class Settings {
  String? ip;
  String? radioPort;
  String? speakerPort;
  String? color;

  Settings({required this.ip, required this.radioPort, required this.speakerPort, required this.color});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(ip: json['ip'], radioPort: json['radioPort'], speakerPort: json['speakerPort'],color: json['color']);
  }

  Map<String, dynamic> toMap() {
    return {'ip': ip, 'radioPort': radioPort, 'speakerPort': speakerPort,'color': color};
  }
}

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));
