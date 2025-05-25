import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:tekio_app/core/locale/string_translation.dart';
import 'package:tekio_app/features/auth/cubit/auth_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authRegisterSuccess) {
          context.go('/home');
        }
      },
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        labelText: 'email'.translate,
                      ),
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(
                        labelText: 'password'.translate,
                      ),
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUnfocus,
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  state.status == AuthStatus.authError
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(state.error!.translate),
                        )
                      : SizedBox(),
                  state.status == AuthStatus.authLoading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            _formKey.currentState?.saveAndValidate();
                            if (_formKey.currentState!.isValid) {
                              context
                                  .read<AuthCubit>()
                                  .createUserWithEmailAndPassword(
                                      _formKey.currentState!.value);
                            }
                          },
                          child: Text('create_account'.translate),
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
