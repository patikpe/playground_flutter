import 'package:flutter/material.dart';

class SingleImageButton extends StatelessWidget {
  const SingleImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200),
      child: ElevatedButton(
        style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
        onPressed: () {},
        child: Image(
          width: double.infinity,
          fit: BoxFit.fill,
          image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/material/content_based_color_scheme_3.png',
          ),
        ),
      ),
    );
  }
}
