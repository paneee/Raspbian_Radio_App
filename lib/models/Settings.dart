import 'dart:convert';

class Settings {
  int? id;
  String? ip;
  String? port;

  Settings({
    required this.id,
    required this.ip,
    required this.port,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(id: json["id"], ip: json['ip'], port: json['port']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ip': ip,
      'port': port,
    };
  }
}

Settings settingsFromJson(String str) => Settings.fromJson(json.decode(str));
