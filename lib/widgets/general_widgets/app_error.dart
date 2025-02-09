import 'package:flutter/material.dart';
import 'package:playground_flutter/core/locale/string_translation.dart';

class AppError extends StatelessWidget {
  final VoidCallback onPressed;
  final String errorMessage;
  final String buttonText;

  const AppError({
    super.key,
    required this.onPressed,
    required this.errorMessage,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(errorMessage.translate),
        MaterialButton(
          onPressed: onPressed,
          child: Text(buttonText.translate),
        ),
      ],
    );
  }
}
