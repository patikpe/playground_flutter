import 'package:flutter/material.dart';

class TextCarousel extends StatelessWidget {
  const TextCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50),
      child: CarouselView(
        itemExtent: 120.0,
        shrinkExtent: 120.0,
        children: CardInfo.values.map((CardInfo info) {
          return ElevatedButton(
            onPressed: () {},
            child: Text(
              info.label,
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

enum CardInfo {
  camera('Cameras', Icons.video_call),
  lighting('Lighting', Icons.lightbulb),
  climate('Climate', Icons.thermostat),
  wifi('Wifi', Icons.wifi),
  media('Media', Icons.library_music),
  security('Security', Icons.crisis_alert),
  safety('Safety', Icons.medical_services),
  more('More', Icons.add);

  const CardInfo(this.label, this.icon);
  final String label;
  final IconData icon;
}
