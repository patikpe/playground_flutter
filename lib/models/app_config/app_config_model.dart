import 'dart:convert';
import 'dart:ui';

class AppConfigModel {
  String appName;
  Color mainColor;
  List<String> supportedLocales;

  AppConfigModel({
    required this.appName,
    required this.mainColor,
    required this.supportedLocales,
  });

  factory AppConfigModel.fromRawJson(String str) =>
      AppConfigModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
        appName: json["appName"],
        mainColor: Color(int.parse(json["mainColor"])),
        supportedLocales: List<String>.from(json["supportedLocales"]),
      );

  Map<String, dynamic> toJson() => {
        "appName": appName,
        "mainColor": mainColor.toString(),
        "supportedLocales": List<dynamic>.from(supportedLocales.map((x) => x)),
      };
}
