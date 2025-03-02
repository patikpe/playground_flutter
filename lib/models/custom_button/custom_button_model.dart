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
}
