import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:playground_flutter/core/locale/string_translation.dart';
import 'package:playground_flutter/features/auth/cubit/auth_cubit.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final _formRegister = FormGroup({
    'email': FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'confirmPassword': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
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
              formGroup: _formRegister,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ReactiveTextField<String>(
                      key: const Key('email'),
                      formControlName: 'email',
                      decoration: InputDecoration(
                        label: Text('email'.translate),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'field_required'.translate,
                        ValidationMessage.email: (error) =>
                            'field_email_required'.translate,
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ReactiveTextField<String>(
                      key: const Key('password'),
                      formControlName: 'password',
                      decoration: InputDecoration(
                        label: Text('password'.translate),
                        prefixIcon: Icon(Icons.password),
                      ),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'field_required'.translate,
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ReactiveTextField<String>(
                      key: const Key('confirmPassword'),
                      formControlName: 'confirmPassword',
                      decoration: InputDecoration(
                        label: Text('confirm_password'.translate),
                        prefixIcon: Icon(Icons.password),
                      ),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'field_required'.translate,
                      },
                    ),
                  ),
                  ReactiveFormConsumer(
                    key: const Key('submit'),
                    builder: (context, form, _) => ElevatedButton(
                      onPressed: () {
                        // context
                        //     .read<AuthCubit>()
                        //     .signInWithEmailAndPassword(form.value);
                      },
                      child: Text('submit'.translate),
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
                context.go('/login');
              },
              child: Text('have_account'.translate),
            ),
          ),
        ],
      ),
    );
  }
}
