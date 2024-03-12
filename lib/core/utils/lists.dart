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
