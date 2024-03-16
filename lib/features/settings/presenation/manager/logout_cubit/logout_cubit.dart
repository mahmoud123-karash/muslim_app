import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'logout_states.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(InitailLogoutState());
  static LogoutCubit get(context) => BlocProvider.of(context);

  void logout() async {
    try {
      emit(LoadingLogoutState());
      CacheHelper.removeData(key: 'email');
      var box = Hive.box<UserModel>(userBox);
      await box.clear();
      FirebaseAuth.instance.signOut();
      emit(SuccessLogoutState());
    } catch (e) {
      emit(ErrorLogoutState(e.toString()));
    }
  }
}
