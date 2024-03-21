import 'dart:developer';

import 'package:muslim_app/core/services/messaging_service.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:intl/intl.dart';

void setNextPrayerNotification(List<SalatEntity> list) {
  DateTime now = DateTime.now();
  int day = now.day;

  List<NextPrayerModel> times = getTimes(list, (day - 1));
  List<NextPrayerModel> afterList =
      times.where((element) => element.date.isAfter(now)).toList();
  if (afterList.isNotEmpty) {
    NextPrayerModel nextPrayer = afterList.first;
    log(nextPrayer.name);
    log(nextPrayer.date.toString());
    MessagingService.setNotification(
      title: nextPrayer.name,
      body: DateFormat('hh:mm a').format(nextPrayer.date),
      id: 1,
      hour: nextPrayer.date.hour,
      minute: nextPrayer.date.minute,
    );
  } else {
    List<NextPrayerModel> times = getTimes(list, day);
    List<NextPrayerModel> afterList =
        times.where((element) => element.date.isAfter(now)).toList();
    NextPrayerModel nextPrayer = afterList.first;
    log(nextPrayer.name);
    log(nextPrayer.date.toString());
    MessagingService.setNotification(
      title: nextPrayer.name,
      body: DateFormat('hh:mm a').format(nextPrayer.date),
      id: 1,
      hour: nextPrayer.date.hour,
      minute: nextPrayer.date.minute,
    );
  }
}

List<NextPrayerModel> getTimes(List<SalatEntity> list, int day) {
  bool isEnglish = Intl.getCurrentLocale() == 'en';
  SalatEntity model = list[day];
  List<NextPrayerModel> times = [];
  DateTime fajr = extractFormatedTime(model.fajr, day + 1);
  DateTime dhuhr = extractFormatedTime(model.dhuhr, day + 1);
  DateTime asr = extractFormatedTime(model.asr, day + 1);
  DateTime maghrib = extractFormatedTime(model.maghrib, day + 1);
  DateTime isha = extractFormatedTime(model.isha, day + 1);
  times.add(
    NextPrayerModel(
      name: isEnglish ? 'Fajr prayer' : 'صلاة الفجر',
      date: fajr,
    ),
  );
  times.add(
    NextPrayerModel(
      name: isEnglish ? 'Dhur prayer' : 'صلاة الظهر',
      date: dhuhr,
    ),
  );
  times.add(
    NextPrayerModel(
      name: isEnglish ? 'Asr prayer' : 'صلاة العصر',
      date: asr,
    ),
  );
  times.add(
    NextPrayerModel(
      name: isEnglish ? 'Maghrib prayer' : 'صلاة المغرب',
      date: maghrib,
    ),
  );
  times.add(
    NextPrayerModel(
      name: isEnglish ? 'Isha prayer' : 'صلاة العشاء',
      date: isha,
    ),
  );
  return times;
}

class NextPrayerModel {
  final String name;
  final DateTime date;

  NextPrayerModel({
    required this.name,
    required this.date,
  });
}
