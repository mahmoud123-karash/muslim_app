import 'package:flutter/material.dart';
import 'package:muslim_app/features/quran/data/models/surahs_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/surah_banner_last_place_widget.dart';

import 'bassmallah_widget.dart';
import 'quran_ayah_text_widget.dart';
import 'surah_banner_first_place_widget.dart';

class QuranPagesWidget extends StatelessWidget {
  const QuranPagesWidget({
    super.key,
    required this.pageIndex,
    required this.cubit,
  });
  final int pageIndex;
  final QuranCubit cubit;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: pageIndex == 0 || pageIndex == 1
          ? EdgeInsets.symmetric(horizontal: width * .13)
          : const EdgeInsets.symmetric(horizontal: 16.0),
      margin: pageIndex == 0 || pageIndex == 1
          ? EdgeInsets.symmetric(vertical: width * .34)
          : const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 32.0,
            ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          cubit.getCurrentPageAyahsSeparatedForBasmalah(pageIndex).length,
          (i) {
            List<Ayah> ayahs =
                cubit.getCurrentPageAyahsSeparatedForBasmalah(pageIndex)[i];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SurahBannerFirstPlaceWidget(
                  pageIndex: pageIndex,
                  i: i,
                ),
                cubit.getSurahNumberByAyah(ayahs.first) == 9 ||
                        cubit.getSurahNumberByAyah(ayahs.first) == 1
                    ? const SizedBox.shrink()
                    : BassmallahWidget(
                        cubit: cubit,
                        ayahs: ayahs,
                      ),
                QuranAyahTextWidget(
                  pageIndex: pageIndex,
                  ayahs: ayahs,
                  cubit: cubit,
                ),
                SurahBannerLastPlaceWidget(
                  pageIndex: pageIndex,
                  i: i,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
