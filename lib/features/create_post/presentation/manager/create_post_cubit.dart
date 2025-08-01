import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/firebase_services.dart';
import 'package:nabd/features/create_post/presentation/manager/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  static CreatePostCubit get(BuildContext context) => BlocProvider.of(context);

  String? photo;

  void changePhoto(String? photo) {
    this.photo = photo;
    emit(ChangePhoto());
  }

  Future<void> createPost({required String description}) async {
    emit(CreatePostLoading());
    var firebase = FirebaseServices();
    var key = firebase.realtimeDb.ref('homePost').push().key;
    final bytes = await File(photo!).readAsBytes();
    final url = await firebase.uploadFile('homePost', '$key.jpg', bytes);
    log('url: $url');
    await firebase
        .writeToRealtimeDB('homePost/$key', {
          'description': description,
          'creatorId': firebase.auth.currentUser!.uid,
          'keyPost': key,
          'time': DateTime.now().toString(),
          'photo': url,
          'likes': [],
          'comments': [],
          'views': '0',
        })
        .then((onValue) {
          emit(CreatePostSuccess());
        })
        .catchError((onError) {
          emit(CreatePostError());
        });
  }
}
