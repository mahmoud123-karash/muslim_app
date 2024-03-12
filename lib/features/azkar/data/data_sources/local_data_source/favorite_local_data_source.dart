import 'package:hive/hive.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';

abstract class FavoriteLocalDataSource {
  List<Zekr> get();
}

class FavoriteLocalDataSourceImpl extends FavoriteLocalDataSource {
  @override
  List<Zekr> get() {
    var box = Hive.box<Zekr>(azkarBox);
    return box.values.toList();
  }
}
