import 'package:hive/hive.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';

abstract class ReciterLocalDataSource {
  List<ReciterEntity> getReciterLocalData();
}

class ReciterLocalDataSourceImpl extends ReciterLocalDataSource {
  @override
  List<ReciterEntity> getReciterLocalData() {
    var box = Hive.box<ReciterEntity>(reciterBox);
    return box.values.toList();
  }
}
