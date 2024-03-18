import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class DayTimeRowWidget extends StatelessWidget {
  const DayTimeRowWidget(
      {super.key,
      required this.dateTime,
      required this.hijri,
      required this.controller});
  final String dateTime, hijri;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Intl.getCurrentLocale() == 'en';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInCubic,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: secondColor,
            ),
          ),
          const Spacer(),
          Text(
            isEnglish ? dateTime : hijri,
            style: TextStyles.style15.copyWith(
              fontWeight: FontWeight.bold,
              color: appColor,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInCubic,
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: secondColor,
            ),
          )
        ],
      ),
    );
  }
}
