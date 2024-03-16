import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class AyatRowWidget extends StatelessWidget {
  const AyatRowWidget(
      {super.key, required this.surahName, required this.ayahNum});
  final String surahName;
  final String ayahNum;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Intl.getCurrentLocale() == 'en';
    return Row(
      children: [
        Text(
          S.of(context).aya_of_the_day,
          style: TextStyles.style16Bold.copyWith(
            color: appColor,
          ),
        ),
        const Spacer(),
        Text(
          "$surahName ($ayahNum)",
          style: TextStyles.style20Bold.copyWith(
            color: appColor,
            fontSize: isEnglish ? 15 : 20,
            fontFamily: uthmanic2Family,
          ),
        ),
      ],
    );
  }
}
