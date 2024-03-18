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
    var height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: NextsalahColumBuilerWidget(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height / 1.9,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
          ),
        ),
      ],
    );
  }
}
