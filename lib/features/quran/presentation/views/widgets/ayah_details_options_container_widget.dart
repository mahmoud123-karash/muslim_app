import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';

class AyahDetailsOptionsContainerWidget extends StatelessWidget {
  const AyahDetailsOptionsContainerWidget(
      {super.key,
      required this.lable,
      required this.icon,
      required this.onPressed});
  final String lable;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: appColor,
              ),
              Text(lable)
            ],
          ),
        ),
      ),
    );
  }
}
