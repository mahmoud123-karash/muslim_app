import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/azkar/data/data_sources/local_data_source/azkar_local_data_source.dart';
import 'package:muslim_app/features/azkar/data/data_sources/local_data_source/favorite_local_data_source.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/domain/repo/azkar_repo.dart';

class AzkarRepoImpl extends AzkarRepo {
  final AzkarLocalDataSource azkarLocalDataSource;
  final FavoriteLocalDataSource favoriteLocalDataSource;
  AzkarRepoImpl(
    this.azkarLocalDataSource,
    this.favoriteLocalDataSource,
  );
  @override
  Future<Either<String, List<Zekr>>> loadAzkar() async {
    try {
      List<Zekr> list = await azkarLocalDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  List<Zekr> getFavoriteAzkar() {
    return favoriteLocalDataSource.get();
  }

  @override
  Future<List<Zekr>> addFavoriteAzkar({required Zekr model}) async {
    var box = Hive.box<Zekr>(azkarBox);
    await box.add(model);
    return favoriteLocalDataSource.get();
  }

  @override
  Future<List<Zekr>> deleteFavoriteAzkar({required Zekr model}) async {
    var box = Hive.box<Zekr>(azkarBox);
    List<Zekr> list = box.values.toList();
    list.remove(model);
    await box.clear();
    await box.addAll(list);
    return favoriteLocalDataSource.get();
  }
}
