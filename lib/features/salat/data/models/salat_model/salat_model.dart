import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class SalatModel extends SalatEntity {
  Timings? timings;
  Date? date;
  Meta? meta;

  SalatModel({this.timings, this.date, this.meta})
      : super(
          fajr: timings!.fajr ?? '',
          sunrise: timings.sunrise ?? '',
          dhuhr: timings.dhuhr ?? '',
          asr: timings.asr ?? '',
          sunset: timings.sunset ?? '',
          maghrib: timings.maghrib ?? '',
          isha: timings.isha ?? '',
          dateTime: '${date!.gregorian!.weekday!.en}${date.readable}',
          jihri:
              '${date.hijri!.weekday!.ar}${date.hijri!.day}${date.hijri!.month!.ar}${date.hijri!.year}',
        );

  factory SalatModel.fromJson(Map<String, dynamic> json) => SalatModel(
        timings: json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );
}
