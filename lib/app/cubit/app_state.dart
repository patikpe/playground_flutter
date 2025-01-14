part of 'app_cubit.dart';

enum AppStatus {
  appInitial,
  appLoaded,
}

final class AppState extends Equatable {
  final AppStatus status;
  final AppConfigModel? appConfig;
  final ThemeMode themeMode;

  const AppState({
    this.status = AppStatus.appInitial,
    this.appConfig,
    this.themeMode = ThemeMode.system,
  });

  AppState copyWith({
    AppStatus? status,
    AppConfigModel? appConfig,
    ThemeMode? themeMode,
  }) {
    return AppState(
      status: status ?? this.status,
      appConfig: appConfig ?? this.appConfig,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [
        status,
        appConfig,
        themeMode,
      ];
}
