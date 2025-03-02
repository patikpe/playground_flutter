import 'package:flutter/material.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';

class TextCarousel extends StatelessWidget {
  final List<CustomButtonModel> buttonItems;

  const TextCarousel({
    required this.buttonItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50),
      child: CarouselView(
        itemExtent: 120.0,
        shrinkExtent: 120.0,
        children: buttonItems.map((e) {
          return ElevatedButton(
            onPressed: e.onPress,
            child: Text(
              e.label ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}
