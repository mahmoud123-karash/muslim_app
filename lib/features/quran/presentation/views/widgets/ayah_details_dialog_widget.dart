import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_cubit.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/dialog_row_title_widget.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/tafseer_deatils_row_widget.dart';
import 'package:intl/intl.dart';

import 'package:muslim_app/features/quran/presentation/views/widgets/tafseer_text_builder_widget.dart';

import 'ayah_details_row_widget.dart';

class AyahDetailsDialogWidget extends StatefulWidget {
  const AyahDetailsDialogWidget(
      {super.key,
      required this.ayah,
      required this.surahName,
      required this.surahEnName});
  final Ayah ayah;
  final String surahName;
  final String surahEnName;

  @override
  State<AyahDetailsDialogWidget> createState() =>
      _AyahDetailsDialogWidgetState();
}

class _AyahDetailsDialogWidgetState extends State<AyahDetailsDialogWidget> {
  bool isTafseer = false;
  late AyahCubit cubit;
  @override
  void didChangeDependencies() {
    cubit = AyahCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    cubit.stopAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = Intl.getCurrentLocale() == 'ar';

    return AlertDialog(
      title: DialogRowTitleWidget(
        surahName: isArabic ? widget.surahName : widget.surahEnName,
        ayahNumber: isArabic
            ? getArabicNumber(widget.ayah.ayahNumber)
            : widget.ayah.ayahNumber.toString(),
        shareText: widget.ayah.text,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            if (!isTafseer)
              Text(
                widget.ayah.text,
                style: TextStyles.style20.copyWith(
                  fontFamily: uthmanic2Family,
                  letterSpacing: 0,
                  wordSpacing: 0,
                ),
                textAlign: TextAlign.justify,
              ),
            if (isTafseer)
              TafseerTextBuilderWidget(ayahNum: widget.ayah.ayahUQNumber),
            const SizedBox(
              height: 50,
            ),
            isTafseer
                ? TafseerDetailsRowWidget(
                    text: cubit.getTafsser(widget.ayah.ayahUQNumber),
                    ayaTap: () {
                      isTafseer = false;
                      setState(() {});
                    },
                  )
                : AyahDetailsRowWidget(
                    ayah: widget.ayah,
                    tafseerTap: () {
                      isTafseer = true;
                      setState(() {});
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
