import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompassImageWidget extends StatelessWidget {
  const CompassImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/compass.svg',
      alignment: Alignment.center,
    );
  }
}
