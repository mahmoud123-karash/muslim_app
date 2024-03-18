import 'package:flutter/material.dart';
import 'package:muslim_app/features/salat/data/models/prayer_model/prayer_model.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/text_salah_widget.dart';
import '../../../../../core/contants/constants.dart';
import 'package:intl/intl.dart';

class PrayerTimeItemWidget extends StatelessWidget {
  const PrayerTimeItemWidget(
      {super.key, required this.model, required this.nextPrayer});
  final PrayerModel model;
  final PrayerModel? nextPrayer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: nextPrayer == null
              ? appColor.withOpacity(0.3)
              : nextPrayer!.dateTime == model.dateTime
                  ? secondColor.withOpacity(0.7)
                  : appColor.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                model.icon,
                height: 40,
                width: 40,
              ),
              const SizedBox(
                width: 7,
              ),
              TextSalahsWidget(text: model.name),
              const Spacer(),
              TextSalahsWidget(
                text: DateFormat('hh:mm a').format(model.dateTime),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
