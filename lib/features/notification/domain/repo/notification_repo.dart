import 'package:dartz/dartz.dart';
import 'package:muslim_app/features/notification/data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<Either<String, List<NotificationModel>>> get();
  Future<Either<String, List<NotificationModel>>> send({
    required String text,
    required String title,
  });
}
