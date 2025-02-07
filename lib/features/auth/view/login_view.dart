import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/features/auth/cubit/auth_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formLogin = FormGroup({
    'email': FormControl<String>(),
    'password': FormControl<String>(),
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ReactiveForm(
              formGroup: _formLogin,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ReactiveTextField<String>(
                      key: const Key('email'),
                      formControlName: 'email',
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ReactiveTextField<String>(
                      key: const Key('password'),
                      formControlName: 'password',
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),
                  ),
                  ReactiveFormConsumer(
                    key: const Key('submit'),
                    builder: (context, form, _) => ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthCubit>()
                            .createUserWithEmailAndPassword(form.value);
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/register');
              },
              child: const Text('Create an account'),
            ),
          ),
        ],
      ),
    );
  }
}
