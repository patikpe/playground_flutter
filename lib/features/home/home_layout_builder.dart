import 'package:flutter/widgets.dart';
import 'package:playground_flutter/models/home/home_model.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/custom_button_enum.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/icon_carousel.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/image_button.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/image_carousel.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/text_carousel.dart';

class HomeLayoutBuilder extends StatelessWidget {
  final CustomButtonEnum customButtonType;
  final List<ButtonTypeModel> buttonItems;

  const HomeLayoutBuilder({
    required this.customButtonType,
    required this.buttonItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (customButtonType) {
      case CustomButtonEnum.iconCarousel:
        return IconCarousel(
          buttonItems: buttonItems,
        );
      case CustomButtonEnum.textCarousel:
        return TextCarousel(
          buttonItems: buttonItems,
        );
      case CustomButtonEnum.imageCarousel:
        return ImageCarousel(
          buttonItems: buttonItems,
        );
      case CustomButtonEnum.imageButton:
        return ImageButton(
          buttonItems: buttonItems,
        );
    }
  }
}
