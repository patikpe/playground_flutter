import 'package:flutter/material.dart';

class SingleImageButton extends StatelessWidget {
  const SingleImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: BoxConstraints(maxHeight: 200),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
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
    );
  }
}
