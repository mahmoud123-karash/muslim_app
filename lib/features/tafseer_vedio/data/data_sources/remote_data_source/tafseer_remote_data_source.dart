import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';

abstract class TafseerRemoteDataSource {
  Future<List<TafseerVideoModel>> get();
}

class TafseerRemoteDataSourceImpl extends TafseerRemoteDataSource {
  @override
  Future<List<TafseerVideoModel>> get() async {
    List<TafseerVideoModel> list = [];
    var result = await FirebaseFirestore.instance
        .collection('tafseer')
        .orderBy('date', descending: true)
        .get();
    for (var element in result.docs) {
      TafseerVideoModel model =
          TafseerVideoModel.formJson(element.data(), element.id);
      list.add(model);
    }
    return list;
  }
}
