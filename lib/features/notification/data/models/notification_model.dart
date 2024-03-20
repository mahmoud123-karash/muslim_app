import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String? uid;
  final String text;
  final Timestamp date;

  NotificationModel({
    this.uid,
    required this.text,
    required this.date,
  });

  factory NotificationModel.formJson(Map<String, dynamic> json, uid) =>
      NotificationModel(
        text: json['text'] ?? '',
        date: json['date'] ?? Timestamp.now(),
        uid: uid,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "date": date,
      };
}
