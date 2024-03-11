import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muslim_app/features/auth/domain/repo/auth_repo.dart';

abstract class UseCase {
  Future<Either<String, String>> signUp({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  });
}

class RegisterUseCase extends UseCase {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  @override
  Future<Either<String, String>> signUp({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
  }) async {
    try {
      String uid = await authRepo.signUp(email: email, password: password);
      authRepo.createUser(
        name: name,
        email: email,
        phone: phone,
        gender: gender,
        uid: uid,
      );
      return right('created');
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }
}
