import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/share_ayat_widget.dart';
import 'package:quran/quran.dart' as quran;

import 'ayat_row_widget.dart';

class VerseOfTheDayContainerWidget extends StatelessWidget {
  const VerseOfTheDayContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int randomSurah = CacheHelper.getData(key: 'sRandom') ?? 1;
    int randomAyah = CacheHelper.getData(key: 'vRandom') ?? 1;
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
                randomAyah: randomAyah,
                randomSurah: randomSurah,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                quran.getVerse(
                  randomSurah,
                  randomAyah,
                ),
                style: TextStyles.style20.copyWith(
                  fontFamily: uthmanicFamily,
                  fontWeight: FontWeight.bold,
                  color: blackColor.withOpacity(0.8),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              ShareAyatWidget(
                text: quran.getVerse(randomSurah, randomAyah),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
