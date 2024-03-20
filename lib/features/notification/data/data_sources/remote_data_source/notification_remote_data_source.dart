import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muslim_app/features/notification/data/models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> get();
}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  @override
  Future<List<NotificationModel>> get() async {
    List<NotificationModel> list = [];
    var result = await FirebaseFirestore.instance
        .collection('notifications_m')
        .orderBy('date', descending: true)
        .get();

    for (var element in result.docs) {
      NotificationModel model =
          NotificationModel.formJson(element.data(), element.id);
      list.add(model);
    }
    return list;
  }
}
