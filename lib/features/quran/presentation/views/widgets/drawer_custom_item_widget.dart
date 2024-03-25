import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class DrawerCustomItemWidget extends StatelessWidget {
  const DrawerCustomItemWidget(
      {super.key,
      required this.ontap,
      required this.text,
      required this.color,
      required this.tColor});
  final VoidCallback ontap;
  final String text;
  final Color color;
  final Color tColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.style15.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: tColor,
            ),
          ),
        ),
      ),
    );
  }
}
