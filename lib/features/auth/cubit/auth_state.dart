part of 'auth_cubit.dart';

enum AuthStatus {
  authInitial,
  authLoaded,
}

final class AuthState extends Equatable {
  final AuthStatus status;
  const AuthState({
    this.status = AuthStatus.authInitial,
  });

  AuthState copyWith({
    AuthStatus? status,
  }) {
    return AuthState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
