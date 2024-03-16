import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio;
  DioHelper(this.dio);

  String baseUri = 'https://api.quran.com/api/v4/';

  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    var reciters = await dio.get('$baseUri$endPoint');
    return reciters.data;
  }

  Future download({
    required String uri,
    required String filePath,
    required Function(int, int) onReceiveProgress,
  }) async {
    await dio.download(
      uri,
      filePath,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
