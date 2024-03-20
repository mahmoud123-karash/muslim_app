import 'dart:convert';

import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio;
  DioHelper(this.dio);

  String baseUri = 'https://api.quran.com/api/v4/';
  String salatBaseUri = 'https://api.aladhan.com/v1/calendar/';

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

  Future<List> getSalatData({
    required double latitude,
    required double longitude,
  }) async {
    DateTime now = DateTime.now();
    var reciters = await dio.get(
      '$salatBaseUri${now.year}/${now.month}?latitude=$latitude&longitude=$longitude',
    );
    return reciters.data['data'];
  }

  var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  var headersList = {
    'Content-Type': 'application/json',
    'Authorization':
        'key=AAAA5dtd33w:APA91bGSX52vxRvxAadVccpfgR5T0gKCBJvO1uc9vZLKvTqWIZjkcDjZhBewxEXMRxZH6wBuiJL0hmAtuAlxuss80HlCxkrncdNcvDdo-LTU8PW34NA83v_TSeHne2AiOz8cRdqrNQ_H'
  };

  void sendNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    var notificationBody = {
      "to": '/topics/azkar',
      "priority": "high",
      "notification": {"title": title, "body": body, "sound": "default"},
      'data': data,
    };
    dio.options.headers.addAll(headersList);
    await dio.post(url.toString(), data: json.encode(notificationBody));
  }
}
