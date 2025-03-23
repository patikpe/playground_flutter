import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/models/custom_button/custom_button_model.dart';

class IconCarousel extends StatelessWidget {
  final List<CustomButtonModel> buttonItems;
  const IconCarousel({
    required this.buttonItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100),
      child: CarouselView(
        itemExtent: 120.0,
        shrinkExtent: 120.0,
        onTap: (index) => (buttonItems[index].onPress ??
            context.push(buttonItems[index].navPath ?? '/notFound')),
        children: buttonItems.map((e) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(
                  IconData(
                    int.parse(e.iconCode ?? '0xe237'),
                    fontFamily: 'MaterialIcons',
                  ),
                  size: 32.0,
                ),
              ),
              if (e.label != null)
                Text(
                  e.label ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                  softWrap: false,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
