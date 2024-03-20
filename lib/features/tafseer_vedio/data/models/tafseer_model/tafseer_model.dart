import 'package:cloud_firestore/cloud_firestore.dart';

class TafseerVideoModel {
  String? uid;
  final String personName;
  final String tafseerTitle;
  final String vedioUri;
  final Timestamp date;

  TafseerVideoModel({
    this.uid,
    required this.personName,
    required this.date,
    required this.tafseerTitle,
    required this.vedioUri,
  });

  factory TafseerVideoModel.formJson(Map<String, dynamic> json, uid) =>
      TafseerVideoModel(
        personName: json['personName'] ?? '',
        tafseerTitle: json['tafseerTitle'] ?? '',
        vedioUri: json['vedioUri'] ?? '',
        date: json['date'] ?? Timestamp.now(),
        uid: uid,
      );

  Map<String, dynamic> toJson() => {
        "personName": personName,
        "tafseerTitle": tafseerTitle,
        "vedioUri": vedioUri,
        "date": date,
      };
}
