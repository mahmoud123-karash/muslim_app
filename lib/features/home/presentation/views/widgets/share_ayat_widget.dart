import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/generated/l10n.dart';

class ShareAyatWidget extends StatelessWidget {
  const ShareAyatWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        share(title: S.of(context).aya_of_the_day, text: text);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: appColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).share,
              style: TextStyles.style16Bold.copyWith(
                color: appColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.copy,
                color: appColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
