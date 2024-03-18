import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/salat/data/models/prayer_model/prayer_model.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class NextSalahColumWidget extends StatelessWidget {
  const NextSalahColumWidget({super.key, required this.model});
  final PrayerModel model;

  @override
  Widget build(BuildContext context) {
    int hours = model.dateTime.difference(DateTime.now()).inHours;
    int minutes = model.dateTime.difference(DateTime.now()).inMinutes % 60;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        Image.asset(
          fit: BoxFit.cover,
          model.icon,
          height: 60,
          width: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          S.of(context).time_of_the_next_prayer,
          style: TextStyles.style16Bold.copyWith(
            color: secondColor,
          ),
        ),
        Text(
          DateFormat('hh:mm a').format(model.dateTime),
          style: TextStyles.style25.copyWith(
            color: appColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${S.of(context).prayer} ${model.name}",
          style: TextStyles.style16Bold.copyWith(
            color: appColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${S.of(context).after} ${getHours(hours, context)} ${hours == 0 ? '' : S.of(context).and}${getMintues(minutes, context)}',
          style: TextStyles.style17.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: naskhFamily,
          ),
        ),
      ],
    );
  }
}

String getHours(int hours, BuildContext context) {
  if (hours == 0) {
    return '';
  } else if (hours == 1) {
    return S.of(context).hour_1;
  } else if (hours == 2) {
    return S.of(context).hours_2;
  } else {
    return '$hours ${S.of(context).hours} ';
  }
}

String getMintues(int mintues, BuildContext context) {
  if (mintues == 1) {
    return S.of(context).mintue_1;
  } else if (mintues == 2) {
    return S.of(context).mintue_2;
  } else if (mintues <= 10) {
    return '$mintues ${S.of(context).mintues}';
  } else {
    return '$mintues ${S.of(context).mintue_1}';
  }
}
