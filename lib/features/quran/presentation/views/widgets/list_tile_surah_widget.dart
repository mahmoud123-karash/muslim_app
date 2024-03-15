import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:quran/quran.dart' as quran;
import 'package:intl/intl.dart';

import 'surah_num_stack_widget.dart';

class ListTileSurahWidget extends StatelessWidget {
  const ListTileSurahWidget(
      {super.key, required this.index, required this.pageController});
  final int index;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    Surah surah = QuranCubit.get(context).surahs[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5),
        onTap: () {
          QuranCubit.get(context).closeDrawer();
          pageController.jumpToPage(surah.ayahs.first.page - 1);
        },
        leading: SurahNumStackWidget(
          surah: surah,
        ),
        title: Intl.getCurrentLocale() == 'en'
            ? Text(QuranCubit.get(context).surahs[index].englishName)
            : SvgPicture.asset(
                'assets/svg/surah_name/00${index + 1}.svg',
                height: 40,
                colorFilter: ColorFilter.mode(
                  secondColor,
                  BlendMode.srcIn,
                ),
              ),
        trailing: quran.getPlaceOfRevelation(index + 1) == 'Makkah'
            ? SizedBox(
                height: 30,
                width: 40,
                child: Image.asset(Assets.imagesMakka),
              )
            : SizedBox(
                height: 50,
                width: 45,
                child: Image.asset(Assets.imagesMasjid),
              ),
      ),
    );
  }
}
