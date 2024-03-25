import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:muslim_app/core/api/dio_helper.dart';
import 'package:muslim_app/core/errors/failure.dart';

abstract class UseCase {
  Future<Either<Failure, String>> download({
    required int reciterId,
    required int surahNum,
    required String url,
    required Function(int, int) onReceiveProgress,
  });
}

class DownloadUseCase extends UseCase {
  final DioHelper dioHelper;

  DownloadUseCase(this.dioHelper);
  @override
  Future<Either<Failure, String>> download({
    required int reciterId,
    required int surahNum,
    required String url,
    required Function(int, int) onReceiveProgress,
  }) async {
    try {
      String filePath =
          '${(await getTemporaryDirectory()).path}$surahNum $reciterId';
      await dioHelper.download(
        uri: url,
        filePath: filePath,
        onReceiveProgress: onReceiveProgress,
      );
      return right(filePath);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
