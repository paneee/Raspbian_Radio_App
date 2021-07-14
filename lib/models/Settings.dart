import 'dart:convert';

class Settings {
  String? ip;
  String? port;

  Settings({
    required this.ip,
    required this.port,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(ip: json['ip'], port: json['port']);
  }
}

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));
