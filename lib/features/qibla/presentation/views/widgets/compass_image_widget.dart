import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/contants/constants.dart';

class CompassImageWidget extends StatelessWidget {
  const CompassImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/compass.svg',
      alignment: Alignment.center,
      colorFilter: ColorFilter.mode(
        appColor,
        BlendMode.srcIn,
      ),
    );
  }
}
