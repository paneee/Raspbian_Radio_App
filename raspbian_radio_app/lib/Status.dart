import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    required this.actualPlaying,
    required this.listWebRadio,
  });

  ActualPlaying actualPlaying;
  List<ActualPlaying> listWebRadio;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        actualPlaying: ActualPlaying.fromJson(json["actualPlaying"]),
        listWebRadio: List<ActualPlaying>.from(
            json["listWebRadio"].map((x) => ActualPlaying.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "actualPlaying": actualPlaying.toJson(),
        "listWebRadio": List<dynamic>.from(listWebRadio.map((x) => x.toJson())),
      };
}

class ActualPlaying {
  ActualPlaying({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory ActualPlaying.fromJson(Map<String, dynamic> json) => ActualPlaying(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
