import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabd/core/services/firebase_services.dart';
import 'package:nabd/features/home/models/post_model.dart';
import 'package:nabd/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  final _firebase = FirebaseServices();
  final userId = FirebaseServices().auth.currentUser?.uid;

  List<PostModel> posts = [];

  StreamSubscription<DatabaseEvent>? _postsSubscription;

  /// استمع إلى تغييرات البوستات من Realtime DB
  void listenToPosts() {
    emit(HomePostLoading());

    _postsSubscription?.cancel();

    _postsSubscription = _firebase.listenToRealtimeDB('homePost').listen(
      (event) async {
        try {
          final data = event.snapshot.value;
          if (data != null && data is Map) {
            posts.clear();

            for (var entry in data.entries) {
              final postData = entry.value as Map;
              final uid = postData['creatorId'];

              // جلب بيانات المستخدم
              final userSnapshot = await _firebase.getUserData(uid);
              final userMap = userSnapshot?.data() as Map<String, dynamic>?;

              // دمج بيانات المستخدم مع بيانات البوست
              final enrichedPost = {
                ...postData,
                'creatorName': userMap?['name'] ?? '',
                'creatorPhoto': userMap?['photo'] ?? '',
              };

              posts.add(PostModel.fromMap(enrichedPost));
            }

            // ترتيب حسب الوقت - الأحدث أولًا
            posts.sort((a, b) {
              final aTime = DateTime.tryParse(a.time) ?? DateTime(2000);
              final bTime = DateTime.tryParse(b.time) ?? DateTime(2000);
              return bTime.compareTo(aTime);
            });

            emit(HomePostSuccess());
          } else {
            posts.clear();
            emit(HomePostError());
          }
        } catch (e) {
          print('Error while parsing posts: $e');
          emit(HomePostError());
        }
      },
    );
  }

  /// الإعجاب أو إلغاء الإعجاب بمنشور
  Future<void> toggleLike(String postKey, {required bool like}) async {
    emit(LikePostLoading());
    if (userId == null) return;
    try {
      final ref = FirebaseDatabase.instance.ref('homePost/$postKey/likes');
      final snapshot = await ref.get();
      List<dynamic> currentLikes = [];

      if (snapshot.exists) {
        currentLikes = List.from(snapshot.value as List);
      }

      if (like && !currentLikes.contains(userId)) {
        currentLikes.add(userId);
      } else if (!like && currentLikes.contains(userId)) {
        currentLikes.remove(userId);
      }

      await ref.set(currentLikes);

      emit(LikePostSuccess());
    } catch (e) {
      print('Error in toggleLike: $e');
      emit(LikePostError());
    }
  }

  Future<void> likePost(String postKey) async {
    await toggleLike(postKey, like: true);
  }

  Future<void> unlikePost(String postKey) async {
    await toggleLike(postKey, like: false);
  }

  @override
  Future<void> close() {
    _postsSubscription?.cancel();
    return super.close();
  }
}
