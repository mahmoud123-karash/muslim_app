import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class TextSalahsWidget extends StatelessWidget {
  const TextSalahsWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.style16Bold.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
