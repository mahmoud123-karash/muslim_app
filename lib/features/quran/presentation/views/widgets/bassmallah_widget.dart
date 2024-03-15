import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';

class BassmallahWidget extends StatelessWidget {
  const BassmallahWidget({
    super.key,
    required this.cubit,
    required this.ayahs,
  });
  final QuranCubit cubit;
  final List<Ayah> ayahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ayahs.first.ayahNumber == 1
          ? (cubit.getSurahNumberByAyah(ayahs.first) == 95 ||
                  cubit.getSurahNumberByAyah(ayahs.first) == 97)
              ? const BassMallah2()
              : const BassMallah()
          : const SizedBox.shrink(),
    );
  }
}

class BassMallah extends StatelessWidget {
  const BassMallah({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/besmAllah.svg',
      width: ifBigScreenSize(150.0.w, 200.0.w, context),
      colorFilter: ColorFilter.mode(
        secondColor,
        BlendMode.srcIn,
      ),
    );
  }
}

class BassMallah2 extends StatelessWidget {
  const BassMallah2({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/besmAllah2.svg',
      width: ifBigScreenSize(150.w, 200.0.w, context),
      colorFilter: ColorFilter.mode(
        secondColor,
        BlendMode.srcIn,
      ),
    );
  }
}
