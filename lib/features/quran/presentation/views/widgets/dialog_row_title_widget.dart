import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/generated/l10n.dart';

class DialogRowTitleWidget extends StatelessWidget {
  const DialogRowTitleWidget(
      {super.key,
      required this.surahName,
      required this.ayahNumber,
      required this.shareText});
  final String surahName, shareText, ayahNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$surahName: $ayahNumber',
          style: TextStyles.style19.copyWith(
            fontFamily: naskhFamily,
            fontWeight: FontWeight.bold,
            color: secondColor,
          ),
        ),
        const Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            share(title: S.of(context).share, text: shareText);
          },
          child: Container(
            decoration: BoxDecoration(
              color: appColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.share_outlined,
                color: secondColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
