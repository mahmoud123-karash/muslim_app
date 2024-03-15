import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class DurationTextWidget extends StatelessWidget {
  const DurationTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.style13.copyWith(
        fontWeight: FontWeight.bold,
        color: secondColor,
      ),
    );
  }
}
