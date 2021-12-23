import 'dart:convert';

class Settings {
  String? ip;
  String? port;
  String? color;

  Settings({required this.ip, required this.port, required this.color});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(ip: json['ip'], port: json['port'], color: json['color']);
  }

  Map<String, dynamic> toMap() {
    return {'ip': ip, 'port': port, 'color': color};
  }
}

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));
