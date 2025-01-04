import 'dart:convert';

class AppConfigModel {
  String appName;
  String mainColor;

  AppConfigModel({
    required this.appName,
    required this.mainColor,
  });

  factory AppConfigModel.fromRawJson(String str) =>
      AppConfigModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
        appName: json["appName"],
        mainColor: json["mainColor"],
      );

  Map<String, dynamic> toJson() => {
        "appName": appName,
        "mainColor": mainColor,
      };
}
