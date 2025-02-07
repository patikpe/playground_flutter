import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  signInWithEmailAndPassword(Map<String, Object?> value) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: value['email'] as String,
        password: value['password'] as String,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  createUserWithEmailAndPassword(Map<String, Object?> value) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: value['email'] as String,
        password: value['password'] as String,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
