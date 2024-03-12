import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';

abstract class AzkarLocalDataSource {
  Future<List<Zekr>> get();
}

class AzkarLocalDataSourceImpl extends AzkarLocalDataSource {
  @override
  Future<List<Zekr>> get() async {
    final jsondata = await rootBundle.loadString('assets/json/azkar.json');
    final Map<String, dynamic> map = json.decode(jsondata);
    final list = map['data'] as List<dynamic>;
    return list.map((e) => Zekr.fromJson(e)).toList();
  }
}
