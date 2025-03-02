import 'package:flutter/material.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';

class ImageCarousel extends StatelessWidget {
  final List<CustomButtonModel> buttonItems;

  const ImageCarousel({
    required this.buttonItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView(
        itemExtent: 330,
        shrinkExtent: 200,
        children: buttonItems
            .map(
              (e) => ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: e.onPress,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        e.imageUrl ?? '', // Use Default image
                      ),
                    ),
                    if (e.label != null)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15.0, bottom: 15.0),
                        child: Text(
                          e.label ?? '',
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
