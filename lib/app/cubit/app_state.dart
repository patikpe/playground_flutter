part of 'app_cubit.dart';

enum AppStatus {
  appInitial,
  appLoaded,
}

final class AppState extends Equatable {
  final AppStatus status;
  final AppConfigModel? appConfig;

  const AppState({
    this.status = AppStatus.appInitial,
    this.appConfig,
  });

  AppState copyWith({
    AppStatus? status,
    AppConfigModel? appConfig,
  }) {
    return AppState(
      status: status ?? this.status,
      appConfig: appConfig ?? this.appConfig,
    );
  }

  @override
  List<Object?> get props => [
        status,
        appConfig,
      ];
}
