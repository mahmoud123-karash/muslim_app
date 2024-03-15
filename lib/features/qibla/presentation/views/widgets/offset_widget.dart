import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/generated/l10n.dart';

class OffsetWidget extends StatelessWidget {
  const OffsetWidget({super.key, required this.offset});
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          width: 50,
          Assets.imagesKaaba,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          "${offset.toStringAsFixed(0)}°   SE  ${S.of(context).from_real_nourth}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
