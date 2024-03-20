import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/utils/adout_chaildern.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnglih = Intl.getCurrentLocale() == 'en';
    return Scaffold(
      appBar: appAppBar(S.of(context).about_app),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor.withOpacity(0.2),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text.rich(
                style: TextStyles.style15.copyWith(color: appColor),
                textAlign: TextAlign.start,
                TextSpan(children: isEnglih ? enChaliders : arChaliders),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
