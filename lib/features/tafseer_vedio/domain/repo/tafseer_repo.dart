import 'package:dartz/dartz.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';

abstract class TafseerRepo {
  Future<Either<String, List<TafseerVideoModel>>> getData();
  Future<Either<String, List<TafseerVideoModel>>> addNewTafseer({
    required String personName,
    required String tafseerTitle,
    required String vedioUri,
  });
  Future<Either<String, List<TafseerVideoModel>>> removeTafseer({
    required String uid,
  });
  Future<Either<String, List<TafseerVideoModel>>> editTafseer({
    required String uid,
    required String personName,
    required String tafseerTitle,
    required String vedioUri,
  });
}
