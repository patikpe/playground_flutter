import 'package:collection/collection.dart';

enum CustomButtonEnum {
  iconCarousel("iconCarousel"),
  textCarousel("textCarousel"),
  imageCarousel("imageCarousel"),
  imageButton("singleImageButton");

  const CustomButtonEnum(this.code);

  final String code;

  static CustomButtonEnum? fromString(String? string) =>
      CustomButtonEnum.values.firstWhereOrNull(
        (e) => e.code == string,
      );
}
