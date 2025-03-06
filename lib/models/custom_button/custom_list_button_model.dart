import 'dart:convert';

import 'package:playground_flutter/models/custom_button/custom_button_enum.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';

class CustomListButtonModel {
  CustomButtonEnum? buttonType;
  List<CustomButtonModel> buttonItems;

  CustomListButtonModel({
    required this.buttonType,
    required this.buttonItems,
  });

  factory CustomListButtonModel.fromRawJson(String str) =>
      CustomListButtonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomListButtonModel.fromJson(Map<String, dynamic> json) =>
      CustomListButtonModel(
        buttonType: CustomButtonEnum.fromString(json["buttonType"]),
        buttonItems: List<CustomButtonModel>.from(
            json["buttonItems"].map((x) => CustomButtonModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "buttonType": buttonType?.code,
        "buttonItems": List<dynamic>.from(buttonItems.map((x) => x.toJson())),
      };
}
