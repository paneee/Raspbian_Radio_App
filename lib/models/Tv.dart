import 'dart:convert';

class ApiCommand {
  String? name;
  String? content;

  ApiCommand({
    required this.name,
    required this.content,
  });

  factory ApiCommand.fromJson(Map<String, dynamic> json) {
    return ApiCommand(name: json['name'], content: json['content']);
  }
}

List<ApiCommand> tvCommandsFromJson(String str) =>
    List<ApiCommand>.from(json.decode(str).map((x) => ApiCommand.fromJson(x)));

ApiCommand tvCommandFromJson(String str) =>
    ApiCommand.fromJson(json.decode(str));
