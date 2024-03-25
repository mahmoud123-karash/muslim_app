import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/services/location_service.dart';
import 'package:muslim_app/features/salat/domain/repo/salat_repo.dart';
import 'salat_states.dart';

class SalatCubit extends Cubit<SalatStates> {
  SalatCubit(this.salatRepo) : super(InitailSalatState());
  static SalatCubit get(context) => BlocProvider.of(context);
  final SalatRepo salatRepo;

  void getPrayers({bool isUpdate = false}) async {
    if (isUpdate) {
      emit(LoadingGetPrayersState());
      String message = await LocationService.handleLocationPermission();
      if (message == '') {
        var result = await salatRepo.getPrayer(isUpdate: isUpdate);
        result.fold(
          (failure) {
            emit(ErrorGetPrayersState(failure.message));
          },
          (list) {
            // setNextPrayerNotification(list);
            emit(SuccessGetPrayersState(list));
          },
        );
      } else {
        emit(ErrorGetPrayersState(message));
      }
    } else {
      var result = await salatRepo.getPrayer(isUpdate: isUpdate);
      result.fold(
        (failure) {
          emit(ErrorGetPrayersState(failure.message));
        },
        (list) {
          // setNextPrayerNotification(list);
          emit(SuccessGetPrayersState(list));
        },
      );
    }
  }
}
