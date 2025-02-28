import 'package:flutter/widgets.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/custom_button_enum.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_carousel/icon_carousel.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_carousel/image_carousel.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_carousel/text_carousel.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_image/double_image_button.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_image/single_image_button.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/button_image/triple_image_button.dart';

class CustomButton extends StatelessWidget {
  final CustomButtonEnum customButtonType;

  const CustomButton({required this.customButtonType, super.key});

  @override
  Widget build(BuildContext context) {
    switch (customButtonType) {
      case CustomButtonEnum.iconCarousel:
        return IconCarousel();
      case CustomButtonEnum.textCarousel:
        return TextCarousel();
      case CustomButtonEnum.imageCarousel:
        return ImageCarousel();
      case CustomButtonEnum.singleImageButton:
        return SingleImageButton();
      case CustomButtonEnum.doubleImageButton:
        return DoubleImageButton();
      case CustomButtonEnum.tripleImageButton:
        return TripleImageButton();
    }
  }
}
