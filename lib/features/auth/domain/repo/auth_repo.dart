import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<String> signUp({
    required String email,
    required String password,
  });

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String uid,
  });

  Future<Either<String, String>> loginwithEmailAndPass({
    required String email,
    required String password,
  });

  Future<Either<String, String>> deleteAccount();
}
