import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:quran/quran.dart' as quran;
import 'package:intl/intl.dart';

class AyatRowWidget extends StatelessWidget {
  const AyatRowWidget(
      {super.key, required this.randomSurah, required this.randomAyah});
  final int randomSurah;
  final int randomAyah;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).aya_of_the_day,
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
        ),
        const Spacer(),
        Text(
          "${Intl.getCurrentLocale() == 'en' ? quran.getSurahNameEnglish(randomSurah) : quran.getSurahNameArabic(randomSurah)}($randomAyah)",
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
        ),
      ],
    );
  }
}
