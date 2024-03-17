import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<String, String>> updateProfile({
    required String name,
    required String uid,
    required String email,
    required int age,
    required String gender,
    required String image,
    required String phone,
  });
}
