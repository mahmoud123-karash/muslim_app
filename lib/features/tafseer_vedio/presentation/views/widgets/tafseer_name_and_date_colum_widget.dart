import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:intl/intl.dart';

class TafseerNameAndDateColumWidegt extends StatelessWidget {
  const TafseerNameAndDateColumWidegt({super.key, required this.model});
  final TafseerVideoModel model;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 120,
      width: width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.tafseerTitle,
            style: TextStyles.style14.copyWith(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          Text(
            model.personName,
            style: TextStyles.style15.copyWith(
              color: appColor,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const Spacer(),
          Container(
            constraints: BoxConstraints(maxWidth: width / 2 - 50),
            child: Text(
              DateFormat.yMMMEd().format(model.date.toDate()),
              style: TextStyles.style12.copyWith(
                color: secondColor,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
