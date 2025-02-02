import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    print('LoginView');

    return TextButton(
      onPressed: () {
        context.push('/register');
      },
      child: Text('data'),
    );
  }
}
