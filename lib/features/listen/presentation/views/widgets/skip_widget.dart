import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget(
      {super.key,
      required this.ontap,
      required this.icon,
      required this.isHome});
  final VoidCallback ontap;
  final IconData icon;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'skip',
      onPressed: ontap,
      icon: Icon(
        icon,
        size: isHome ? 30 : 50,
        color: secondColor,
      ),
    );
  }
}
