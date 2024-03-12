import 'package:dartz/dartz.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';

abstract class AzkarRepo {
  Future<Either<String, List<Zekr>>> loadAzkar();

  List<Zekr> getFavoriteAzkar();
  Future<List<Zekr>> addFavoriteAzkar({required Zekr model});
  Future<List<Zekr>> deleteFavoriteAzkar({required Zekr model});
}
