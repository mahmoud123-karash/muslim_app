import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/auth/domain/repo/auth_repo.dart';
import 'package:muslim_app/features/auth/presentation/manager/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  final AuthRepo authRepo;

  void loginWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    var result = await authRepo.loginwithEmailAndPass(
      email: email,
      password: password,
    );
    result.fold((message) {
      emit(ErrorLoginState(message));
    }, (uid) {
      emit(SuccessLoginState(uid));
    });
  }
}
