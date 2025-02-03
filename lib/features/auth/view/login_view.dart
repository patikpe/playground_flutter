import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      listener: (context, state) {},
      child: ElevatedButton(
        onPressed: () {
          context.push('/register');
        },
        child: const Text('Register'),
      ),
    );
    // return BlocBuilder<AuthCubit, AuthState>(
    //   builder: (context, state) {
    //     return ElevatedButton(
    //       onPressed: () {
    //         context.push('/register');
    //       },
    //       child: const Text('Register'),
    //     );
    //   },
    // );
  }
}
