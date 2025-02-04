import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/features/auth/cubit/auth_cubit.dart';

class AuthView extends StatelessWidget {
  final Widget child;

  const AuthView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: child,
      ),
    );
  }
}
