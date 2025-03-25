import 'dart:convert';
import 'dart:ui';

class CustomButtonModel {
  String? iconCode;
  String? imageUrl;
  String? label;
  String? navPath;
  VoidCallback? onPress;

  CustomButtonModel({
    this.iconCode,
    this.imageUrl,
    this.label,
    this.navPath,
    this.onPress,
  });

  factory CustomButtonModel.fromRawJson(String str) =>
      CustomButtonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomButtonModel.fromJson(Map<String, dynamic> json) =>
      CustomButtonModel(
        iconCode: json["iconCode"],
        imageUrl: json["imageUrl"],
        label: json["label"],
        navPath: json["navPath"],
      );

  Map<String, dynamic> toJson() => {
        "iconCode": iconCode,
        "imageUrl": imageUrl,
        "label": label,
        "navPath": navPath,
      };
}
