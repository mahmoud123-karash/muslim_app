import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/quran/data/models/surahs_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_cubit.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/tafseer_deatils_row_widget.dart';

import 'package:muslim_app/features/quran/presentation/views/widgets/tafseer_text_builder_widget.dart';

import 'ayah_details_row_widget.dart';

class AyahDetailsDialogWidget extends StatefulWidget {
  const AyahDetailsDialogWidget(
      {super.key, required this.ayah, required this.surahName});
  final Ayah ayah;
  final String surahName;

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
    return AlertDialog(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appColor.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${widget.surahName}: ${getArabicNumber(widget.ayah.ayahNumber)}',
            style: TextStyles.style19.copyWith(
              fontFamily: naskhFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
              height: 25,
            ),
            isTafseer
                ? TafseerDetailsRowWidget(
                    text: cubit.getTafsser(widget.ayah.ayahNumber),
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
