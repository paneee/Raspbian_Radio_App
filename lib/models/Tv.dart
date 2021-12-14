import 'dart:convert';

class TvCommand {
  String? name;
  String? content;

  TvCommand({
    required this.name,
    required this.content,
  });

  factory TvCommand.fromJson(Map<String, dynamic> json) {
    return TvCommand(name: json['name'], content: json['content']);
  }
}

List<TvCommand> tvCommandsFromJson(String str) =>
    List<TvCommand>.from(json.decode(str).map((x) => TvCommand.fromJson(x)));

TvCommand tvCommandFromJson(String str) => TvCommand.fromJson(json.decode(str));
