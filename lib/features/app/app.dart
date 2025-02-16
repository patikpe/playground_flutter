import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_flutter/core/router/app_router.dart';
import 'package:playground_flutter/core/app/app_theme.dart';
import 'package:playground_flutter/features/app/cubit/app_cubit.dart';
import 'package:playground_flutter/widgets/general_widgets/app_error.dart';
import 'package:playground_flutter/widgets/general_widgets/app_loading.dart';

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
              });
              return AppLoading();
            case AppStatus.appLoadingError:
              return AppError(
                errorMessage: 'Error loading app',
                buttonText: 'Retry',
                onPressed: () {
                  context.read<AppCubit>().getAppConfig();
                },
              );
            case AppStatus.appLoaded:
              return MaterialApp.router(
                title: state.appConfig?.appName,
                theme: AppTheme.appTheme(
                  Color(int.parse(state.appConfig!.mainColor)),
                  Brightness.light,
                ),
                darkTheme: AppTheme.appTheme(
                  Color(int.parse(state.appConfig!.mainColor)),
                  Brightness.dark,
                ),
                themeMode: state.themeMode,
                routerConfig: AppRouter.router,
                localizationsDelegates: [
                  DefaultMaterialLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                ],
                supportedLocales:
                    state.appConfig!.supportedLocales.map((locale) {
                  var split = locale.split('_');
                  return Locale(split[0].trim(), split[1].trim());
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
