import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class PageViewItemWidget extends StatelessWidget {
  const PageViewItemWidget(
      {super.key, required this.image, required this.lable});
  final String image, lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          lable,
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
