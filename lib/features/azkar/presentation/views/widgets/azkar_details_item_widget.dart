import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:intl/intl.dart';
import 'azkar_action_row_widget.dart';

class AzkarDetailsItemWidget extends StatelessWidget {
  const AzkarDetailsItemWidget({super.key, required this.zekr});
  final Zekr zekr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: Intl.getCurrentLocale() == 'en'
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              zekr.zekr,
              style: TextStyles.style20.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: uthmanic2Family,
              ),
              textAlign: Intl.getCurrentLocale() == 'en'
                  ? TextAlign.end
                  : TextAlign.start,
            ),
            if (zekr.description != '') const Divider(),
            if (zekr.description != '')
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  zekr.description,
                  style: TextStyles.style13.copyWith(
                    fontWeight: FontWeight.bold,
                    color: secondColor,
                  ),
                  textAlign: Intl.getCurrentLocale() == 'en'
                      ? TextAlign.end
                      : TextAlign.start,
                ),
              ),
            const Divider(),
            AzkarActionRowWidget(zekr: zekr),
          ],
        ),
      ),
    );
  }
}
