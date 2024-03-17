import 'package:dartz/dartz.dart';
import 'package:muslim_app/core/errors/failure.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';

abstract class SalatRepo {
  Future<Either<Failure, List<SalatEntity>>> getPrayer({
    required bool isUpdate,
  });
}
