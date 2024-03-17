import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/profile/domain/repo/profile_repo.dart';

import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(InitialProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepo profileRepo;

  void updateProfile({
    required String name,
    required String uid,
    required String email,
    required int age,
    required String gender,
    required String image,
    required String phone,
  }) async {
    emit(LoadingUpdateProfileState());
    var result = await profileRepo.updateProfile(
      name: name,
      uid: uid,
      email: email,
      age: age,
      gender: gender,
      image: image,
      phone: phone,
    );
    result.fold((message) {
      emit(ErrorUpdateProfileState(message));
    }, (r) {
      emit(SuccessUpdateProfileState());
    });
  }
}
