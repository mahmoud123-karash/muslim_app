import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:muslim_app/core/services/messaging_service.dart';
import 'package:muslim_app/features/salat/data/models/prayer_model/prayer_model.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/text_salah_widget.dart';
import '../../../../../core/contants/constants.dart';
import 'package:intl/intl.dart';

class PrayerTimeItemWidget extends StatelessWidget {
  const PrayerTimeItemWidget({
    super.key,
    required this.model,
    required this.nextPrayer,
  });
  final PrayerModel model;
  final PrayerModel? nextPrayer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        DateTime now = DateTime.now();
        MessagingService.setNotification(
          title: 'text noti',
          body: DateFormat('hh:mm a').format(now),
          id: 5,
          hour: 23,
          minute: 57,
        );
      },
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
              SvgPicture.asset(
                model.icon,
                width: 35,
                height: 35,
                colorFilter: ColorFilter.mode(blackColor, BlendMode.srcIn),
                fit: BoxFit.scaleDown,
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
