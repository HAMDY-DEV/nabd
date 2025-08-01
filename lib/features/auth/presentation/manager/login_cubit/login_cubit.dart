import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/firebase_services.dart';
import 'package:nabd/features/auth/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  void login({required String email, required String password}) async {
    emit(LoginLoading());
    final firebase = FirebaseServices();

    try {
      await firebase.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      log('Login error code: ${e.code}');
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'Email address is not registered.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'invalid-credential':
          errorMessage = 'The login credentials are incorrect or have expired.';
          break;
        default:
          errorMessage = 'An unexpected error occurred: ${e.message}';
      }

      emit(LoginError(message: errorMessage));
    } catch (e) {
      emit(LoginError(message: 'خطأ غير متوقع: ${e.toString()}'));
      log('Login general error: ${e.toString()}');
    }
  }
}
