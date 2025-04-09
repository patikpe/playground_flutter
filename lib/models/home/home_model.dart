import 'dart:convert';

import 'package:rashin_widgets/models/custom_button/custom_list_button_model.dart';

class HomeModel {
  List<CustomListButtonModel> homeListItems;

  HomeModel({
    required this.homeListItems,
  });

  factory HomeModel.fromRawJson(String str) =>
      HomeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        homeListItems: List<CustomListButtonModel>.from(json["homeListItems"]
            .map((x) => CustomListButtonModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "homeListItems":
            List<dynamic>.from(homeListItems.map((x) => x.toJson())),
      };
}
