import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/firebase_services.dart';
import 'package:nabd/features/auth/presentation/manager/registration_cubit/registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  static RegistrationCubit get(BuildContext context) =>
      BlocProvider.of(context);
  void register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegistrationLoading());
    final firebase = FirebaseServices();

    try {
      await firebase.auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((onValue) async {
            await firebase.setUserData(
              uid: onValue.user!.uid,
              data: {
                'name': name,
                'email': email,
                'creationTime': onValue.user!.metadata.creationTime,
                'isNewUser': onValue.additionalUserInfo!.isNewUser,
                'uid': onValue.user!.uid,
                'verifiedAccount': 'false',
                'deviceToken': await firebase.getFcmToken(),
                'photo':
                    'https://firebasestorage.googleapis.com/v0/b/sehety-1.appspot.com/o/defaultPhoto%2Fsimple-user-default-icon-free-png.webp?alt=media&token=4a5f596f-e7d0-469e-acc7-844300d13ca1',
              },
            );
            emit(RegistrationSuccess());
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegistrationError(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegistrationError(
            message: 'The account already exists for that email.',
          ),
        );
      } else {
        emit(RegistrationError(message: 'Error: ${e.message}'));
      }
    } catch (e) {
      emit(RegistrationError(message: 'Error : ${e.toString()}'));
      log(e.toString());
    }
  }
}
