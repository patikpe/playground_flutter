import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  signInWithEmailAndPassword(Map<String, Object?> value) async {
    emit(state.copyWith(
      status: AuthStatus.authLoading,
    ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: value['email'] as String,
        password: value['password'] as String,
      );
      emit(state.copyWith(
        status: AuthStatus.authLoginSuccess,
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.authError,
        error: e.code,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.authError,
        error: 'login_user_error',
      ));
    }
  }

  createUserWithEmailAndPassword(Map<String, Object?> value) async {
    emit(state.copyWith(
      status: AuthStatus.authLoading,
    ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: value['email'] as String,
        password: value['password'] as String,
      );
      emit(state.copyWith(
        status: AuthStatus.authRegisterSuccess,
      ));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(
        status: AuthStatus.authError,
        error: e.code,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.authError,
        error: 'create_user_error',
      ));
    }
  }
}
