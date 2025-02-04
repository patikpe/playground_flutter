import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/features/auth/cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
                    child: const Text('Sign in'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/register');
              },
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
