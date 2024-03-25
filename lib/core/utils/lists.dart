import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/features/azkar/presentation/views/azkar_screen.dart';
import 'package:muslim_app/features/listen/presentation/views/listen_to_quran_screen.dart';
import 'package:muslim_app/features/qibla/presentation/views/qibla_screen.dart';
import 'package:muslim_app/features/quran/presentation/views/quran_screen.dart';
import 'package:muslim_app/features/salat/presentation/views/prayer_times_screen.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/tafseer_video_screen.dart';
import 'package:muslim_app/generated/l10n.dart';

List<String> titles(context) => [
      S.of(context).quran_kareem,
      S.of(context).azkar,
      S.of(context).listen_to_quran,
      S.of(context).prayer_times,
      S.of(context).tafsser_video,
      S.of(context).qibla,
    ];

List<String> images = [
  Assets.imagesQuran,
  Assets.imagesDua,
  Assets.imagesSound,
  Assets.imagesSalat,
  Assets.imagesVideo,
  Assets.imagesKaaba,
];

List<Widget> screens = [
  const QuranScreen(),
  const AzkarScreen(),
  const ListenToQuranScreen(),
  const PrayersTimesScreen(),
  const TafseerVideoScreen(),
  const QiblaScreen(),
];

List<int> downThePageIndex = [
  75,
  206,
  330,
  340,
  348,
  365,
  375,
  413,
  416,
  434,
  444,
  451,
  497,
  505,
  524,
  547,
  554,
  556,
  583
];
List<int> topOfThePageIndex = [
  76,
  207,
  331,
  341,
  349,
  366,
  376,
  414,
  417,
  435,
  445,
  452,
  498,
  506,
  525,
  548,
  554,
  555,
  557,
  583,
  584
];

List<String> juzNames = [
  'الجزء الأول',
  'الجزء الثاني',
  'الجزء الثالث',
  'الجزء الرابع',
  'الجزء الخامس',
  'الجزء السادس',
  'الجزء السابع',
  'الجزء الثامن',
  'الجزء التاسع',
  'الجزء العاشر',
  'الجزء الحادي عشر',
  'الجزء الثاني عشر',
  'الجزء الثالث عشر',
  'الجزء الرابع عشر',
  'الجزء الخامس عشر',
  'الجزء السادس عشر',
  'الجزء السابع عشر',
  'الجزء الثامن عشر',
  'الجزء التاسع عشر',
  'الجزء العشرون',
  'الجزء الحادي والعشرون',
  'الجزء الثاني والعشرون',
  'الجزء الثالث والعشرون',
  'الجزء الرابع والعشرون',
  'الجزء الخامس والعشرون',
  'الجزء السادس والعشرون',
  'الجزء السابع والعشرون',
  'الجزء الثامن والعشرون',
  'الجزء التاسع والعشرون',
  'الجزء الثلاثون',
];

List<String> juzEnglishNames = [
  "Juz One",
  "Juz Two",
  "Juz Three",
  "Juz Four",
  "Juz Five",
  "Juz Six",
  "Juz Seven",
  "Juz Eight",
  "Juz Nine",
  "Juz Ten",
  "Juz Eleven",
  "Juz Twelve",
  "Juz Thirteen",
  "Juz Fourteen",
  "Juz Fifteen",
  "Juz Sixteen",
  "Juz Seventeen",
  "Juz Eighteen",
  "Juz Nineteen",
  "Juz Twenty",
  "Juz Twenty-One",
  "Juz Twenty-Two",
  "Juz Twenty-Three",
  "Juz Twenty-Four",
  "Juz Twenty-Five",
  "Juz Twenty-Six",
  "Juz Twenty-Seven",
  "Juz Twenty-Eight",
  "Juz Twenty-Nine",
  "Juz Thirty"
];

List<String> juzFrenchNames = [
  "Juz Un",
  "Juz Deux",
  "Juz Trois",
  "Juz Quatre",
  "Juz Cinq",
  "Juz Six",
  "Juz Sept",
  "Juz Huit",
  "Juz Neuf",
  "Juz Dix",
  "Juz Onze",
  "Juz Douze",
  "Juz Treize",
  "Juz Quatorze",
  "Juz Quinze",
  "Juz Seize",
  "Juz Dix-Sept",
  "Juz Dix-Huit",
  "Juz Dix-Neuf",
  "Juz Vingt",
  "Juz Vingt et Un",
  "Juz Vingt-Deux",
  "Juz Vingt-Trois",
  "Juz Vingt-Quatre",
  "Juz Vingt-Cinq",
  "Juz Vingt-Six",
  "Juz Vingt-Sept",
  "Juz Vingt-Huit",
  "Juz Vingt-Neuf",
  "Juz Trente"
];

List<String> salatNames(context) => [
      S.of(context).fajr,
      S.of(context).dhuhr,
      S.of(context).asr,
      S.of(context).maghrib,
      S.of(context).isha,
    ];

List<String> salatImags = [
  'assets/svg/fajr.svg',
  'assets/svg/dhar.svg',
  'assets/svg/asr.svg',
  'assets/svg/maghrib.svg',
  'assets/svg/isha.svg',
];
