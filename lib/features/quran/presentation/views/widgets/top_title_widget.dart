import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/generated/l10n.dart';

class TopTitleWidget extends StatelessWidget {
  const TopTitleWidget({
    super.key,
    required this.surahName,
    required this.juzNum,
    required this.pageIndex,
  });
  final String surahName;
  final int juzNum;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    int mark = CacheHelper.getData(key: 'saveMark') ?? 700;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            surahName,
            style: TextStyles.style15.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: naskhFamily,
            ),
          ),
          const Spacer(),
          Text(
            '${S.of(context).juz} ${Intl.getCurrentLocale() == 'en' ? juzNum : getArabicNumber(juzNum)}',
            style: TextStyles.style15.copyWith(
              fontFamily: naskhFamily,
              color: secondColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (mark == pageIndex)
            const SizedBox(
              width: 20,
            ),
          if (mark == pageIndex)
            SvgPicture.asset(
              height: 40,
              'assets/svg/bookmark2.svg',
            )
        ],
      ),
    );
  }
}
