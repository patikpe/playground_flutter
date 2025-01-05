import 'dart:convert';
import 'dart:ui';

class AppConfigModel {
  String appName;
  Color mainColor;

  AppConfigModel({
    required this.appName,
    required this.mainColor,
  });

  factory AppConfigModel.fromRawJson(String str) =>
      AppConfigModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
        appName: json["appName"],
        mainColor: Color(int.parse(json["mainColor"])),
      );

  Map<String, dynamic> toJson() => {
        "appName": appName,
        "mainColor": mainColor.toString(),
      };
}
