import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:muslim_app/core/api/dio_helper.dart';
import 'package:muslim_app/features/notification/data/data_sources/remote_data_source/notification_remote_data_source.dart';
import 'package:muslim_app/features/notification/data/models/notification_model.dart';
import 'package:muslim_app/features/notification/domain/repo/notification_repo.dart';

class NotificationRepoImpl extends NotificationRepo {
  final NotificationRemoteDataSource notificationRemoteDataSource;
  final DioHelper dioHelper;

  NotificationRepoImpl(this.notificationRemoteDataSource, this.dioHelper);
  var fireStore = FirebaseFirestore.instance.collection('notifications_m');
  @override
  Future<Either<String, List<NotificationModel>>> get() async {
    try {
      List<NotificationModel> list = await notificationRemoteDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<NotificationModel>>> send({
    required String text,
  }) async {
    try {
      NotificationModel model = NotificationModel(
        text: text,
        date: Timestamp.now(),
      );
      fireStore.add(
        model.toJson(),
      );
      dioHelper.sendNotification(title: "رسالة جديدة", body: text);
      List<NotificationModel> list = await notificationRemoteDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }
}
