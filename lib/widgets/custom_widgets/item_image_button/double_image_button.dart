import 'package:flutter/material.dart';

class DoubleImageButton extends StatelessWidget {
  const DoubleImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {},
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {},
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
