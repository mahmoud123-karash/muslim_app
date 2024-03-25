import 'package:hive/hive.dart';
import 'package:muslim_app/core/api/dio_helper.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/listen/data/models/reciter_model/reciter_model.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';

abstract class ReciterRemoteDataSource {
  Future<List<ReciterEntity>> getReciters();
}

class ReciterRemoteDataSourceImpl extends ReciterRemoteDataSource {
  final DioHelper dioHelper;

  ReciterRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<ReciterEntity>> getReciters() async {
    var response = await dioHelper.getReciters();
    List<ReciterEntity> reciters = parseData(response);
    saveRecitersLocal(reciters);
    return reciters;
  }

  void saveRecitersLocal(List<ReciterEntity> reciters) {
    var box = Hive.box<ReciterEntity>(reciterBox);
    box.addAll(reciters);
  }

  List<ReciterEntity> parseData(Map<String, dynamic> response) {
    List<ReciterEntity> reciters = [];
    for (var e in response['reciters']) {
      ReciterEntity model = ReciterModel.fromJson(e);
      if (model.rewaya != null) {
        reciters.add(model);
      }
    }
    return reciters;
  }
}
