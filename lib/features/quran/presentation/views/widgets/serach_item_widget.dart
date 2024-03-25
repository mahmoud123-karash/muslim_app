import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'ayah_details_dialog_widget.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key, required this.ayah});
  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    var cubit = QuranCubit.get(context);
    bool isArabic = Intl.getCurrentLocale() == 'ar';
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AyahDetailsDialogWidget(
            ayah: ayah,
            surahName: cubit.getSurahNameFromPage(ayah.page),
            surahEnName: cubit.getSurahEnglishNameFromPage(ayah.page),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: appColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    isArabic
                        ? cubit.getSurahNameFromPage(ayah.page)
                        : cubit.getSurahEnglishNameFromPage(ayah.page),
                    style: TextStyles.style20Bold.copyWith(
                      fontFamily: uthmanic2Family,
                      color: secondColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${S.of(context).ayah_num}: ${isArabic ? getArabicNumber(ayah.ayahNumber) : ayah.ayahNumber}",
                    style: TextStyles.style14.copyWith(
                      fontFamily: kufiFamily,
                      fontWeight: FontWeight.bold,
                      color: secondColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ayah.text,
                style: TextStyles.style20.copyWith(
                  fontFamily: uthmanic2Family,
                ),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
