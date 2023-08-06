import 'package:build_manager/domain/models/over_user/over_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract final class FirebaseApi {
  static final _firesore = FirebaseFirestore.instance;
  static final users = _firesore.collection(AppCollection.users);

  static Future<OverUser?> getUser(String uid) async {
    OverUser? user;
    try {
      final userDocumentSnapshot = await users.doc(uid).get();
      final userData = userDocumentSnapshot.data() ?? {};
      user = OverUser.fromJson(userData);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return user;
  }

  static Future setUser(
    String uid, {
    required OverUser user,
  }) async {
    try {
      final userData = user.toJson();
      await users.doc(uid).set(userData);
      
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

abstract final class AppCollection {
  static const users = 'users';
}
