import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/utils/quran_dua_span.dart';

class QuranDuaScreen extends StatelessWidget {
  const QuranDuaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            height: 5000,
            Assets.imagesBorder,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 130,
              horizontal: 20,
            ),
            child: Container(
              color: whiteColor,
              child: SingleChildScrollView(
                child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    children: duaText,
                    style: TextStyles.style20Bold.copyWith(
                      fontFamily: uthmanic2Family,
                      color: appColor,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 70,
            child: Center(
              child: Text(
                'دعاء ختم القران الكريم',
                style: TextStyles.style20.copyWith(
                  fontFamily: kufiFamily,
                  color: secondColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
