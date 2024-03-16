import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/auth/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final UserRemoteDataSource userRemoteDataSource;

  AuthRepoImpl(this.userRemoteDataSource);
  @override
  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user!.uid;
  }

  @override
  void createUser({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String uid,
  }) async {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      gender: gender,
      age: 0,
      image: '',
    );
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
          model.toMap(),
        );
  }

  @override
  Future<Either<String, String>> loginwithEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!user.user!.emailVerified) {
        UserModel model = await userRemoteDataSource.get(uid: user.user!.uid);
        saveEmail(model.email);
        var box = Hive.box<UserModel>(userBox);
        await box.add(model);
        return right(user.user!.uid);
      } else {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        return left('Not');
      }
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  @override
  Future<Either<String, String>> deleteAccount() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        user.delete();
        String uid = CacheHelper.getData(key: 'uid') ?? '';
        await FirebaseFirestore.instance.collection('users').doc(uid).delete();
        return right('r');
      } else {
        return right('re');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        return right('re');
      } else {
        return left(e.code);
      }
    }
  }
}
