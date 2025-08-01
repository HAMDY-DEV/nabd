// استيراد خدمات Firebase اللي هنحتاجها
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class FirebaseServices {
  // استخدام نمط Singleton علشان نضمن إن فيه نسخة واحدة بس من الكلاس في كل المشروع
  static final FirebaseServices _instance = FirebaseServices._internal();
  factory FirebaseServices() => _instance;
  FirebaseServices._internal();

  // تعريف المتغيرات الخاصة بكل خدمة من Firebase
  final FirebaseAuth auth = FirebaseAuth.instance; // المصادقة (تسجيل الدخول)
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance; // قاعدة البيانات السحابية
  final FirebaseStorage storage = FirebaseStorage.instance; // تخزين الملفات
  final FirebaseMessaging messaging = FirebaseMessaging.instance; // الإشعارات
  final FirebaseDatabase realtimeDb =
      FirebaseDatabase.instance; // تعريف متغير Realtime Database

  // دالة لتسجيل الدخول كمستخدم مجهول (ممكن تستخدمها لاختبار سريع)
  Future<User?> signInAnonymously() async {
    try {
      final result = await auth.signInAnonymously();
      return result.user; // بيرجع بيانات المستخدم
    } catch (e) {
      debugPrint('Auth error: $e'); // طباعة الخطأ لو حصل
      return null;
    }
  }

  // دالة لإضافة أو تحديث بيانات مستخدم في Firestore باستخدام uid
  Future<void> setUserData({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection('users').doc(uid).set(data);
      debugPrint('تم حفظ بيانات المستخدم بنجاح');
    } catch (e) {
      debugPrint('Firestore write error: $e');
    }
  }

  // دالة لجلب بيانات مستخدم من Firestore باستخدام الـ uid
  Future<DocumentSnapshot?> getUserData(String uid) async {
    try {
      return await firestore.collection('users').doc(uid).get();
    } catch (e) {
      debugPrint('Firestore error: $e');
      return null;
    }
  }

  // دالة لرفع ملف إلى Firebase Storage
  // بتحتاج مسار الملف، اسمه، ومحتواه كـ Uint8List
  Future<String?> uploadFile(
    String path, // المسار في التخزين
    String fileName, // اسم الملف
    Uint8List data, // البيانات كـ Bytes
  ) async {
    try {
      final ref = storage.ref().child('$path/$fileName');
      await ref.putData(data); // رفع الصورة
      return await ref.getDownloadURL(); // جلب الرابط المباشر
    } catch (e) {
      debugPrint('Storage error: $e');
      return null;
    }
  }

  // دالة لكتابة بيانات إلى Realtime Database
  Future<void> writeToRealtimeDB(String path, dynamic data) async {
    try {
      await realtimeDb.ref(path).set(data); // حفظ البيانات في المسار المحدد
    } catch (e) {
      debugPrint('Realtime DB write error: $e');
    }
  }

  // دالة لقراءة البيانات لمرة واحدة من Realtime Database
  Future<DataSnapshot?> readFromRealtimeDB(String path) async {
    try {
      final snapshot =
          await realtimeDb.ref(path).get(); // جلب البيانات من المسار
      return snapshot;
    } catch (e) {
      debugPrint('Realtime DB read error: $e');
      return null;
    }
  }

  // دالة للاستماع المستمر للتغيرات في Realtime Database
  Stream<DatabaseEvent> listenToRealtimeDB(String path) {
    return realtimeDb
        .ref(path)
        .onValue; // بيرجع Stream تقدر تتعامل معاه في الـ UI
  }

  // دالة للحصول على رمز FCM الخاص بالجهاز (مفيد للإشعارات)
  Future<String?> getFcmToken() async {
    try {
      return await messaging.getToken(); // جلب التوكن
    } catch (e) {
      debugPrint('Messaging error: $e');
      return null;
    }
  }



}
