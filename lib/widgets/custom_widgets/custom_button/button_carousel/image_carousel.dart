import 'package:flutter/material.dart';
import 'package:playground_flutter/widgets/custom_widgets/custom_button/custom_button_enum.dart';

class ImageCarousel extends StatelessWidget {
  final ButtonTypeListModel buttonTypeListData;

  const ImageCarousel({
    required this.buttonTypeListData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView(
        itemExtent: 330,
        shrinkExtent: 200,
        children: ImageInfo.values
            .map(
              (e) => ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {},
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/material/${e.url}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Text(
                        e.title,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
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
  String? imageUrl;
  String? label;
  Function onPress;

  ButtonTypeModel({
    this.imageUrl,
    this.label,
    required this.onPress,
  });
}

enum ImageInfo {
  image0(
    'The Flow',
    'content_based_color_scheme_1.png',
  ),
  image1(
    'Through the Pane',
    'content_based_color_scheme_2.png',
  ),
  image2(
    'Iridescence',
    'content_based_color_scheme_3.png',
  ),
  image3(
    'Sea Change',
    'content_based_color_scheme_4.png',
  ),
  image4(
    'Blue Symphony',
    'content_based_color_scheme_5.png',
  ),
  image5(
    'When It Rains',
    'content_based_color_scheme_6.png',
  ),
  image6(
    'The Flow',
    'content_based_color_scheme_1.png',
  ),
  image7(
    'Through the Pane',
    'content_based_color_scheme_2.png',
  ),
  image8(
    'Iridescence',
    'content_based_color_scheme_3.png',
  ),
  image9(
    'Sea Change',
    'content_based_color_scheme_4.png',
  ),
  image10(
    'Blue Symphony',
    'content_based_color_scheme_5.png',
  ),
  image11(
    'When It Rains',
    'content_based_color_scheme_6.png',
  );

  const ImageInfo(this.title, this.url);
  final String title;

  final String url;
}
