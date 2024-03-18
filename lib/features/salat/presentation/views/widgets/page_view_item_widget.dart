import 'package:flutter/material.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/day_time_row_widget.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/prayers_times_list_view_widget.dart';

class PageViewItemWidget extends StatelessWidget {
  const PageViewItemWidget({
    super.key,
    required this.controller,
    required this.prayer,
    required this.index,
  });
  final PageController controller;
  final SalatEntity prayer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DayTimeRowWidget(
          dateTime: prayer.dateTime,
          hijri: prayer.jihri,
          dayNum: index + 1,
          controller: controller,
        ),
        const SizedBox(
          height: 10,
        ),
        PrayerTimesListViewWidget(
          day: prayer,
          dayNum: index + 1,
        ),
      ],
    );
  }
}
