import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
        const Icon(
          Ionicons.hand_right,
          color: Colors.amber,
        ),
      ],
    );
  }
}
