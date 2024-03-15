import 'package:dartz/dartz.dart';
import 'package:muslim_app/core/errors/failure.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';

abstract class ReciterRepo {
  Future<Either<Failure, List<ReciterEntity>>> getReciterData();
}
