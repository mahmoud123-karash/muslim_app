import 'dart:math';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

void openUri({required Uri url}) async {
  await launchUrl(url).then((value) {});
}

Future<void> share({
  required String title,
  required String text,
}) async {
  await FlutterShare.share(
    title: title,
    text: text,
    linkUrl: appLink,
  );
}

void copyToClipboard(context, text) {
  Clipboard.setData(ClipboardData(text: text));
  showSnackBar(context, S.of(context).copied);
}

DateTime nextScheduledDate(hour, minute) {
  final DateTime now = DateTime.now();
  DateTime scheduledDate = DateTime(
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

String getArabicNumber(int number) {
  ArabicNumbers arabicNumber = ArabicNumbers();
  return arabicNumber.convert(number);
}

void generateVerseOfDay(int ayahCount) {
  int cacheDay = CacheHelper.getData(key: 'vDay') ?? 0;
  DateTime now = DateTime.now();
  int day = now.day;
  if (day != cacheDay) {
    Random random = Random();
    int randomS = random.nextInt(114) + 1;
    int randomV = random.nextInt(ayahCount) + 1;
    saveSRandom(randomS);
    saveVRandom(randomV);
    saveVDay(day);
  }
}

void generateZekrOfDay(List<Zekr> list) {
  int cacheDay = CacheHelper.getData(key: 'zDay') ?? 0;
  DateTime now = DateTime.now();
  int day = now.day;
  if (day != cacheDay) {
    Random random = Random();
    String randomZ = list[random.nextInt(list.length)].zekr;
    saveZRandom(randomZ);
    saveZDay(day);
  }
}

String readStyle(String style) {
  if (style == 'Muallim') {
    return 'المصحف المعلم';
  } else if (style == 'Mujawwad') {
    return 'مجود';
  } else {
    return 'مرتل';
  }
}

String formatDuration({required String duration}) {
  List<String> parts = duration.split('.');
  String timeString = parts[0];
  return timeString;
}

double ifBigScreenSize(double s, double l, BuildContext context) {
  return MediaQuery.of(context).size.width >= 1025.0 ? s : l;
}

int navigateToFirstPage(juzNumber) {
  if (juzNumber == 1) {
    return ((juzNumber - 1) * 20);
  } else {
    return ((juzNumber - 1) * 20) + 1;
  }
}

UserModel getUser() {
  var box = Hive.box<UserModel>(userBox);
  return box.values.toList().first;
}
