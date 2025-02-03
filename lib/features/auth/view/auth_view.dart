import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/features/auth/cubit/auth_cubit.dart';
import 'package:playground_flutter/widgets/general_widgets/app_loading.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: AppLoading(),
    );
  }
}
