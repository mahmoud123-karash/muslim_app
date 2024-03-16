import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/verse_of_the_day_container_widget.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_states.dart';
import 'package:intl/intl.dart';

class VerseOfTheDayBuilderWidget extends StatelessWidget {
  const VerseOfTheDayBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int randomSurah = CacheHelper.getData(key: 'sRandom') ?? 1;
    int randomAyah = CacheHelper.getData(key: 'vRandom') ?? 1;
    return BlocBuilder<QuranCubit, QuranStates>(
      builder: (context, state) {
        List<Surah> list = QuranCubit.get(context).surahs;
        bool isEnglish = Intl.getCurrentLocale() == 'en';
        if (list.isNotEmpty) {
          return VerseOfTheDayContainerWidget(
            surahName: isEnglish
                ? list[randomSurah].englishName
                : list[randomSurah].arabicName,
            ayahNum:
                isEnglish ? randomAyah.toString() : getArabicNumber(randomAyah),
            ayahText: list[randomSurah].ayahs[randomAyah].text,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
