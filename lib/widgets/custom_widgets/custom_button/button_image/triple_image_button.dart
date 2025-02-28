import 'package:flutter/material.dart';

class TripleImageButton extends StatelessWidget {
  const TripleImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(maxHeight: 200),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {},
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: double.infinity,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Text("Just a test label"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero)),
                onPressed: () {},
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        width: double.infinity,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Text("Just a test label"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: ElevatedButton(
              style:
                  ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
              onPressed: () {},
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: Text("Just a test label"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
