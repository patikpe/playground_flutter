import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/app/app_router.dart';
import 'package:playground_flutter/app/app_theme.dart';
import 'package:playground_flutter/app/cubit/app_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          switch (state.status) {
            case AppStatus.appInitial:
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.read<AppCubit>().getAppConfig();
                // FlutterNativeSplash.remove();
              });
              return CircularProgressIndicator();
            case AppStatus.appLoaded:
              return MaterialApp.router(
                title: state.appConfig?.appName,
                theme: AppTheme.appTheme(
                  state.appConfig!.mainColor,
                  Brightness.light,
                ),
                darkTheme: AppTheme.appTheme(
                  state.appConfig!.mainColor,
                  Brightness.dark,
                ),
                themeMode: ThemeMode.system,
                routerConfig: AppRouter.router,
              );
          }
        },
      ),
    );
  }
}
