import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/generated/l10n.dart';

class HomeAppBarTiltleWidget extends StatelessWidget {
  const HomeAppBarTiltleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(S.of(context).welcome_back),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset(
          width: 30,
          height: 30,
          'assets/svg/waving-hand.svg',
        )
      ],
    );
  }
}
