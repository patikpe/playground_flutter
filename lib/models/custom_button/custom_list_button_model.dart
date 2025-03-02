import 'package:playground_flutter/models/custom_button/custom_button_enum.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';

class CustomListButtonModel {
  CustomButtonEnum buttonType;
  List<CustomButtonModel> buttonItems;

  CustomListButtonModel({
    required this.buttonType,
    required this.buttonItems,
  });
}
