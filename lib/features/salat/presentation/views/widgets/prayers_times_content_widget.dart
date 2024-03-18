import 'package:flutter/material.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/next_salah_colum_builder_widget.dart';

import 'page_view_item_widget.dart';

class PrayerTimesContentWidget extends StatefulWidget {
  const PrayerTimesContentWidget({super.key, required this.prayers});
  final List<SalatEntity> prayers;

  @override
  State<PrayerTimesContentWidget> createState() =>
      _PrayerTimesContentWidgetState();
}

class _PrayerTimesContentWidgetState extends State<PrayerTimesContentWidget> {
  late PageController controller;
  @override
  void initState() {
    DateTime now = DateTime.now();
    controller = PageController(initialPage: now.day - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NextsalahColumBuilerWidget(),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: PageView.builder(
            //  physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.prayers.length,
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => PageViewItemWidget(
              controller: controller,
              prayer: widget.prayers[index],
              index: index,
            ),
          ),
        ),
      ],
    );
  }
}
