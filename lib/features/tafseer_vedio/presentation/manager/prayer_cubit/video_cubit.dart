import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/tafseer_vedio/domain/repo/tafseer_repo.dart';

import 'video_states.dart';

class VideoCubit extends Cubit<VideoStates> {
  VideoCubit(this.tafseerRepo) : super(InitailVideoState());
  static VideoCubit get(context) => BlocProvider.of(context);

  final TafseerRepo tafseerRepo;

  void getData() async {
    var result = await tafseerRepo.getData();
    result.fold(
      (message) {
        emit(ErrorGetVideosState(message));
      },
      (list) {
        emit(SuccessGetVideosState(list));
      },
    );
  }

  void addNewTafseer({
    required String personName,
    required String tafseerTitle,
    required String vedioUri,
  }) async {
    emit(LoadingGetVideosState());
    var result = await tafseerRepo.addNewTafseer(
      personName: personName,
      tafseerTitle: tafseerTitle,
      vedioUri: vedioUri,
    );
    result.fold(
      (message) {
        emit(ErrorGetVideosState(message));
      },
      (list) {
        emit(SuccessGetVideosState(list));
      },
    );
  }

  void editTafseer({
    required String uid,
    required String personName,
    required String tafseerTitle,
    required String vedioUri,
  }) async {
    emit(LoadingGetVideosState());
    var result = await tafseerRepo.editTafseer(
      uid: uid,
      personName: personName,
      tafseerTitle: tafseerTitle,
      vedioUri: vedioUri,
    );
    result.fold(
      (message) {
        emit(ErrorGetVideosState(message));
      },
      (list) {
        emit(SuccessGetVideosState(list));
      },
    );
  }

  void removeTafseer({
    required String uid,
  }) async {
    var result = await tafseerRepo.removeTafseer(
      uid: uid,
    );
    result.fold(
      (message) {
        emit(ErrorGetVideosState(message));
      },
      (list) {
        emit(SuccessGetVideosState(list));
      },
    );
  }
}
