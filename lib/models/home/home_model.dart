import 'dart:ui';

import 'package:playground_flutter/widgets/custom_widgets/custom_button/custom_button_enum.dart';

class HomeModel {
  List<ButtonTypeListModel> buttonListItems;

  HomeModel({
    required this.buttonListItems,
  });
}

class ButtonTypeListModel {
  CustomButtonEnum buttonType;
  List<ButtonTypeModel> buttonItems;

  ButtonTypeListModel({
    required this.buttonType,
    required this.buttonItems,
  });
}

class ButtonTypeModel {
  String? image;
  String? label;
  VoidCallback onPress;

  ButtonTypeModel({
    this.image,
    this.label,
    required this.onPress,
  });
}
