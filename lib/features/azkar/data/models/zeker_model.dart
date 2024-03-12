import 'package:hive_flutter/hive_flutter.dart';

part 'zeker_model.g.dart';

@HiveType(typeId: 0)
class Zekr {
  @HiveField(0)
  final int? id;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String count;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String reference;
  @HiveField(6)
  final String zekr;

  Zekr({
    this.id,
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      id: json['id'],
      category: json['category'],
      count: json['count'],
      description: json['description'],
      reference: json['reference'],
      zekr: json['zekr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'zekr': zekr,
    };
  }
}
