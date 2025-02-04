import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('I have an account'),
            ),
          ],
        ),
      ),
    );
  }
}
