import 'package:muslim_app/features/notification/data/models/notification_model.dart';

abstract class NotificationStates {}

class InitailNotificationsState extends NotificationStates {}

class LoadingGetNotificationssState extends NotificationStates {}

class SuccessGetNotificationssState extends NotificationStates {
  final List<NotificationModel> list;
  SuccessGetNotificationssState(this.list);
}

class ErrorGetNotificationssState extends NotificationStates {
  final String message;
  ErrorGetNotificationssState(this.message);
}
