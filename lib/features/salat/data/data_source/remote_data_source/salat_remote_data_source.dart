import 'package:hive/hive.dart';
import 'package:muslim_app/core/api/dio_helper.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/salat/data/models/salat_model/salat_model.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';

abstract class SalatRemoteDataSource {
  Future<List<SalatEntity>> get({
    required double latitude,
    required double longitude,
  });
}

class SalatRemoteDataSourceImpl extends SalatRemoteDataSource {
  final DioHelper dioHelper;

  SalatRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<SalatEntity>> get({
    required double latitude,
    required double longitude,
  }) async {
    List<SalatModel> list = [];
    List result =
        await dioHelper.getSalatData(latitude: latitude, longitude: longitude);

    for (var element in result) {
      SalatModel model = SalatModel.fromJson(element);
      list.add(model);
    }
    var box = Hive.box<SalatEntity>(salatBox);
    await box.addAll(list);
    return list;
  }
}
