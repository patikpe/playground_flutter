part of 'auth_cubit.dart';

enum AuthStatus {
  authError,
  authLoginSuccess,
  authRegisterSuccess,
}

final class AuthState extends Equatable {
  final AuthStatus? status;
  final String? error;

  const AuthState({
    this.status,
    this.error,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
      ];
}
