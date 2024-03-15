import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NeedleImageWidget extends StatelessWidget {
  const NeedleImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/needle.svg',
      fit: BoxFit.contain,
      height: 300,
      alignment: Alignment.center,
    );
  }
}
