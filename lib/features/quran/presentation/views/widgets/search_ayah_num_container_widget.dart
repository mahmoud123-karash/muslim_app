import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class SearchAyahNumContainerWidget extends StatelessWidget {
  const SearchAyahNumContainerWidget({super.key, required this.num});
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${S.of(context).num_of_the_ayahs}: ",
              style: TextStyles.style20.copyWith(
                fontWeight: FontWeight.bold,
                color: whiteColor,
                fontFamily: naskhFamily,
              ),
            ),
            Text(
              "${Intl.getCurrentLocale() == 'en' ? num : getArabicNumber(num)}",
              style: TextStyles.style15.copyWith(
                color: secondColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
