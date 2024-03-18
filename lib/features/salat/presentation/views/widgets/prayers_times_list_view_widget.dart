import 'package:flutter/material.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/prayer_time_item_widget.dart';

class PrayerTimesListViewWidget extends StatefulWidget {
  const PrayerTimesListViewWidget(
      {super.key, required this.day, required this.dayNum});
  final SalatEntity day;
  final int dayNum;

  @override
  State<PrayerTimesListViewWidget> createState() =>
      _PrayerTimesListViewWidgetState();
}

class _PrayerTimesListViewWidgetState extends State<PrayerTimesListViewWidget> {
  List<String> times = [];

  @override
  void didChangeDependencies() {
    times.add(widget.day.fajr);
    times.add(widget.day.dhuhr);
    times.add(widget.day.asr);
    times.add(widget.day.maghrib);
    times.add(widget.day.isha);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => PrayerTimeItemWidget(
          model: PrayerCubit.get(context).getPrayersModels(
              times: times, day: widget.dayNum, context: context)[index],
          nextPrayer: PrayerCubit.get(context).nextPrayer,
        ),
        itemCount: times.length,
      ),
    );
  }
}
