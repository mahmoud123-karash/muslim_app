import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/contants/constants.dart';

class SurahNameWithBannerWidget extends StatelessWidget {
  const SurahNameWithBannerWidget({super.key, required this.num});
  final int num;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/surah_banner2.svg',
          ),
          SizedBox(
            width: 120.w,
            child: SurahNameWidget(num: num),
          ),
        ],
      ),
    );
  }
}

class SurahNameWidget extends StatelessWidget {
  const SurahNameWidget({super.key, required this.num});
  final int num;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/surah_name/00$num.svg',
      height: 30,
      colorFilter: ColorFilter.mode(secondColor, BlendMode.srcIn),
    );
  }
}
