import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/firebase_services.dart';
import 'package:nabd/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  static ForgotPasswordCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(ForgotPasswordLoading());
    final firebase = FirebaseServices();
    try {
      await firebase.auth.sendPasswordResetEmail(email: email.trim());

      emit(ForgotPasswordSuccess(message: 'Password reset email sent.'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ForgotPasswordError(message: 'No user found for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(ForgotPasswordError(message: 'Invalid email address.'));
      } else {
        emit(ForgotPasswordError(message: 'Error: ${e.message}'));
      }
    } catch (e) {
      emit(ForgotPasswordError(message: 'Unexpected error: $e'));
    }
  }
}
