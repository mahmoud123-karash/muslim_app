import 'package:hive/hive.dart';

part 'salat_entity.g.dart';

@HiveType(typeId: 3)
class SalatEntity {
  @HiveField(0)
  final String fajr;
  @HiveField(1)
  final String sunrise;
  @HiveField(2)
  final String dhuhr;
  @HiveField(3)
  final String asr;
  @HiveField(4)
  final String sunset;
  @HiveField(5)
  final String maghrib;
  @HiveField(6)
  final String isha;
  @HiveField(7)
  final String dateTime;
  @HiveField(8)
  final String jihri;

  SalatEntity({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.dateTime,
    required this.jihri,
  });
}
