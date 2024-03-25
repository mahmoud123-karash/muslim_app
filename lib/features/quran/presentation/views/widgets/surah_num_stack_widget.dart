import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/settings/presenation/manager/manage_cubit/manage_cubit.dart';

class SurahNumStackWidget extends StatelessWidget {
  const SurahNumStackWidget({super.key, required this.surahNum});
  final int surahNum;

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
            Intl.getCurrentLocale() == 'ar'
                ? getArabicNumber(surahNum)
                : surahNum.toString(),
            style: TextStyles.style12.copyWith(
              fontFamily: kufiFamily,
              color: ManageCubit.get(context).isDark ? whiteColor : null,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
          ),
        ),
      ],
    );
  }
}
