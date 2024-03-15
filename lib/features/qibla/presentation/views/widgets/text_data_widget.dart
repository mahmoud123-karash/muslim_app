import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class TextDataWidget extends StatelessWidget {
  const TextDataWidget(
      {super.key, required this.text, required this.direction});
  final String text;
  final double direction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyles.style17.copyWith(
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
        ),
        Text(
          '${direction.toStringAsFixed(0)}°',
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
            color: secondColor,
          ),
        ),
      ],
    );
  }
}
