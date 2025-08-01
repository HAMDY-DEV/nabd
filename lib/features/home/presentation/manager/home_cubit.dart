import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/firebase_services.dart';
import 'package:nabd/features/home/models/post_model.dart';
import 'package:nabd/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<PostModel> posts = [];
  final userId = FirebaseServices().auth.currentUser?.uid;

  void listenToPosts() {
    final firebase = FirebaseServices();
    emit(HomePostLoading()); // حالة تحميل أولية

    firebase.listenToRealtimeDB('homePost').listen((event) {
      final data = event.snapshot.value;
      if (data != null && data is Map) {
        posts.clear();
        data.forEach((key, value) {
          posts.add(PostModel.fromMap(value));
        });

        // ✅ ترتيب البوستات حسب الوقت (من الأحدث للأقدم)
        posts.sort((a, b) {
          final aTime = DateTime.tryParse(a.time) ?? DateTime(2000);
          final bTime = DateTime.tryParse(b.time) ?? DateTime(2000);
          return bTime.compareTo(aTime); // الأحدث الأول
        });

        emit(HomePostSuccess());
      } else {
        posts.clear();
        emit(HomePostError());
      }
    });
  }

  void getCreatorData(String uid) {
    emit(CreatorPostLoading());
    final firebase = FirebaseServices();
    firebase.getUserData(uid).then((value) {
      if (value != null) {
        final userData = value.data() as Map<String, dynamic>;
        emit(CreatorPostSuccess(userData: userData));
      } else {
        emit(CreatorPostError());
      }
    });
  }

  Future<void> likePost(String postKey) async {
    final ref = FirebaseDatabase.instance.ref('homePost/$postKey/likes');
    final snapshot = await ref.get();
    List<dynamic> currentLikes = [];

    if (snapshot.exists) {
      currentLikes = List.from(snapshot.value as List);
    }

    if (!currentLikes.contains(userId)) {
      currentLikes.add(userId);
      await ref.set(currentLikes);
    }
  }

  Future<void> unlikePost(String postKey) async {
    final ref = FirebaseDatabase.instance.ref('homePost/$postKey/likes');
    final snapshot = await ref.get();
    List<dynamic> currentLikes = [];

    if (snapshot.exists) {
      currentLikes = List.from(snapshot.value as List);
    }

    if (currentLikes.contains(userId)) {
      currentLikes.remove(userId);
      await ref.set(currentLikes);
    }
  }
}
