import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/notification/domain/repo/notification_repo.dart';

import 'notification_states.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit(this.notificationRepo) : super(InitailNotificationsState());
  static NotificationCubit get(context) => BlocProvider.of(context);

  final NotificationRepo notificationRepo;

  void getData() async {
    var result = await notificationRepo.get();
    result.fold(
      (message) {
        emit(ErrorGetNotificationssState(message));
      },
      (list) {
        emit(SuccessGetNotificationssState(list));
      },
    );
  }

  void addNewTafseer({
    required String text,
  }) async {
    emit(LoadingGetNotificationssState());
    var result = await notificationRepo.send(
      text: text,
    );
    result.fold(
      (message) {
        emit(ErrorGetNotificationssState(message));
      },
      (list) {
        emit(SuccessGetNotificationssState(list));
      },
    );
  }
}
