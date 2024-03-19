import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:muslim_app/features/salat/presentation/manager/salat_cubit/salat_cubit.dart';
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
    int cachedMonth = CacheHelper.getData(key: 'month') ?? 0;
    if (cachedMonth != now.month) {
      SalatCubit.get(context).getPrayers(isUpdate: true);
      saveMonth(now.month);
    }
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
                onPageChanged: (value) {
                  PrayerCubit.get(context).getDatNum(value + 1);
                },
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
