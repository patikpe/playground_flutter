import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/features/auth/cubit/auth_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _formRegister = FormGroup({
    'email': FormControl<String>(),
    'password': FormControl<String>(),
    'confirmPassword': FormControl<String>(),
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {},
      child: Column(
        children: [
          ReactiveForm(
            formGroup: _formRegister,
            child: Column(
              children: [
                ReactiveTextField<String>(
                  key: const Key('email'),
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                ReactiveTextField<String>(
                  key: const Key('password'),
                  formControlName: 'password',
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                ReactiveTextField<String>(
                  key: const Key('confirmPassword'),
                  formControlName: 'confirmPassword',
                  decoration: const InputDecoration(
                    label: Text('Confirm Password'),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => ElevatedButton(
                    onPressed: () {
                      context
                          .read<AuthCubit>()
                          .signInWithEmailAndPassword(form.value);
                    },
                    child: const Text('Submit'),
                  ),
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
    );
  }
}
