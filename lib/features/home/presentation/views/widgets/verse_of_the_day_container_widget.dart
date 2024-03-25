import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/share_ayat_widget.dart';

import 'ayat_row_widget.dart';
import 'package:intl/intl.dart';

class VerseOfTheDayContainerWidget extends StatelessWidget {
  const VerseOfTheDayContainerWidget({
    super.key,
    required this.surahName,
    required this.ayahNum,
    required this.ayahText,
  });
  final String surahName;
  final String ayahText;
  final String ayahNum;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Intl.getCurrentLocale() == 'ar';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AyatRowWidget(
                ayahNum: ayahNum,
                surahName: surahName,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                ayahText,
                style: TextStyles.style20.copyWith(
                  fontFamily: uthmanic2Family,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: isArabic ? TextAlign.start : TextAlign.end,
              ),
              const SizedBox(
                height: 15,
              ),
              ShareAyatWidget(
                text: ayahText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
