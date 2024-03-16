import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:intl/intl.dart';

class SurahNumStackWidget extends StatelessWidget {
  const SurahNumStackWidget({super.key, required this.surah});
  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: SvgPicture.asset(
            'assets/svg/sora_num.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 1),
          child: Text(
            Intl.getCurrentLocale() == 'en'
                ? surah.surahNumber.toString()
                : getArabicNumber(surah.surahNumber),
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontFamily: kufiFamily,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }
}
