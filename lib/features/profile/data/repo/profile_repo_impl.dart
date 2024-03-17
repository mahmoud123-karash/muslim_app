import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/features/profile/domain/repo/profile_repo.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<String, String>> updateProfile({
    required String name,
    required String uid,
    required String email,
    required int age,
    required String gender,
    required String image,
    required String phone,
  }) async {
    try {
      late UserModel user;
      if (image == '') {
        user = UserModel(
          name: name,
          email: email,
          phone: phone,
          uid: uid,
          gender: gender,
          age: age,
          image: image,
        );
      } else {
        String uri = await uploadImage(image: image);
        user = UserModel(
          name: name,
          email: email,
          phone: phone,
          uid: uid,
          gender: gender,
          age: age,
          image: uri,
        );
      }
      FirebaseFirestore.instance.collection('users').doc(uid).update(
            user.toMap(),
          );
      var box = Hive.box<UserModel>(userBox);
      await box.clear();
      await box.add(user);
      return right('');
    } catch (e) {
      return left(e.toString());
    }
  }
}

Future<String> uploadImage({required String image}) async {
  File file = File(image);
  DateTime now = DateTime.now();
  var data = await firebase_storage.FirebaseStorage.instance
      .ref()
      .child('images')
      .child('${now.millisecond}${now.microsecond}.jpg')
      .putFile(file);
  String uri = await data.ref.getDownloadURL();
  return uri;
}
