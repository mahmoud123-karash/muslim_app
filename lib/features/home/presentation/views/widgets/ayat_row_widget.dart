import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/generated/l10n.dart';

class AyatRowWidget extends StatelessWidget {
  const AyatRowWidget(
      {super.key, required this.surahName, required this.ayahNum});
  final String surahName;
  final String ayahNum;

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
          "$surahName($ayahNum)",
          style: TextStyles.style20Bold.copyWith(
            color: appColor,
            fontFamily: uthmanic2Family,
          ),
        ),
      ],
    );
  }
}
