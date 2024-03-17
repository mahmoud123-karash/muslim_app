import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_app/core/errors/failure.dart';
import 'package:muslim_app/core/services/location_service.dart';
import 'package:muslim_app/features/salat/data/data_source/local_data_source/local_remote_data_source.dart';
import 'package:muslim_app/features/salat/data/data_source/remote_data_source/salat_remote_data_source.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:muslim_app/features/salat/domain/repo/salat_repo.dart';

class SalatRepImpl extends SalatRepo {
  final SalatRemoteDataSource salatRemoteDataSource;
  final SalatLocalDataSource salatLocalDataSource;

  SalatRepImpl(this.salatRemoteDataSource, this.salatLocalDataSource);
  @override
  Future<Either<Failure, List<SalatEntity>>> getPrayer({
    required bool isUpdate,
  }) async {
    try {
      List<SalatEntity> list = [];
      list = salatLocalDataSource.get();
      if (list.isNotEmpty && !isUpdate) {
        return right(list);
      } else {
        Position position = await LocationService.getPosition();
        list = await salatRemoteDataSource.get(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        return right(list);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
