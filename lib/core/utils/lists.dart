import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/features/azkar/presentation/views/azkar_screen.dart';
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
  const AzkarScreen(),
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
