import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/features/quran/data/models/surahs_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';

import 'custom_span.dart';

class QuranAyahTextWidget extends StatelessWidget {
  const QuranAyahTextWidget({
    super.key,
    required this.pageIndex,
    required this.ayahs,
    required this.cubit,
  });
  final int pageIndex;
  final List<Ayah> ayahs;
  final QuranCubit cubit;
  @override
  Widget build(BuildContext context) {
    bool isDark = CacheHelper.getData(key: 'isdark') ?? false;
    Color textColor = isDark ? Colors.white : Colors.black;
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: RichText(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontFamily: 'page${pageIndex + 1}',
            fontSize: 50,
            height: 2,
            letterSpacing: 2,
            color: Theme.of(context).colorScheme.inversePrimary,
            shadows: const [
              Shadow(
                blurRadius: 0.5,
                offset: Offset(0.5, 0.5),
              ),
            ],
          ),
          children: List.generate(
            ayahs.length,
            (ayahIndex) {
              // cubit.isSelected = cubit.selectedAyahIndexes
              //     .contains(
              //         ayahs[ayahIndex].ayahUQNumber);
              if (ayahIndex == 0) {
                return span(
                  isFirstAyah: true,
                  textColor: textColor,
                  text:
                      "${ayahs[ayahIndex].codeV2[0]}${ayahs[ayahIndex].codeV2.substring(1)}",
                  pageIndex: pageIndex,
                  isSelected: false,
                  fontSize: 100.w,
                  surahNum: cubit.getSurahNumberFromPage(pageIndex),
                  ayahNum: ayahs[ayahIndex].ayahUQNumber,
                  onLongPressStart: (LongPressStartDetails details) {
                    // cubit.toggleAyahSelection(
                    //     ayahs[ayahIndex].ayahUQNumber);
                    // context.showAyahMenu(
                    //     cubit.getSurahNumberFromPage(
                    //         pageIndex),
                    //     ayahs[ayahIndex].ayahNumber,
                    //     ayahs[ayahIndex].codeV2,
                    //     pageIndex,
                    //     ayahs[ayahIndex].text,
                    //     ayahs[ayahIndex].ayahUQNumber,
                    //     cubit.getSurahNameFromPage(
                    //         pageIndex),
                    //     ayahIndex,
                    //     details: details);
                  },
                );
              }
              return span(
                isFirstAyah: false,
                textColor: textColor,
                text: ayahs[ayahIndex].codeV2,
                pageIndex: pageIndex,
                isSelected: true,
                fontSize: 100.w,
                surahNum: cubit.getSurahNumberFromPage(pageIndex),
                ayahNum: ayahs[ayahIndex].ayahUQNumber,
                onLongPressStart: (LongPressStartDetails details) {
                  // cubit.toggleAyahSelection(
                  //     ayahs[ayahIndex].ayahUQNumber);
                  // context.showAyahMenu(
                  //     cubit.getSurahNumberFromPage(
                  //         pageIndex),
                  //     ayahs[ayahIndex].ayahNumber,
                  //     ayahs[ayahIndex].code_v2,
                  //     pageIndex,
                  //     ayahs[ayahIndex].text,
                  //     ayahs[ayahIndex].ayahUQNumber,
                  //     cubit.getSurahNameFromPage(
                  //         pageIndex),
                  //     ayahIndex,
                  //     details: details);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
