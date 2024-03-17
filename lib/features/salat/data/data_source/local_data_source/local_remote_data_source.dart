import 'package:hive/hive.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';

abstract class SalatLocalDataSource {
  List<SalatEntity> get();
}

class SalatLocalDataSourceImpl extends SalatLocalDataSource {
  @override
  List<SalatEntity> get() {
    var box = Hive.box<SalatEntity>(salatBox);
    return box.values.toList();
  }
}
