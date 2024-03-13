import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/utils/lists.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';

import 'surah_name_with_banner_widget.dart';

class SurahBannerFirstPlaceWidget extends StatelessWidget {
  const SurahBannerFirstPlaceWidget(
      {super.key, required this.pageIndex, required this.i});
  final int pageIndex, i;

  @override
  Widget build(BuildContext context) {
    final ayahs = QuranCubit.get(context)
        .getCurrentPageAyahsSeparatedForBasmalah(pageIndex)[i];
    return ayahs.first.ayahNumber == 1
        ? topOfThePageIndex.contains(pageIndex)
            ? const SizedBox.shrink()
            : SurahNameWithBannerWidget(
                num: QuranCubit.get(context).getSurahNumberByAyah(ayahs.first),
              )
        : const SizedBox.shrink();
  }
}
