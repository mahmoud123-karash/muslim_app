import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/sevices/date_sevice.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/location_home_builder_widget.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/verse_of_the_day_container_widget.dart';

import 'widgets/home_grid_view_widget.dart';
import 'widgets/home_row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const LocationHomeBuilderWidget(),
              HomeRowWidget(
                lable: DateSevice.jHijriDate,
                icon: Ionicons.calendar_outline,
              ),
              const SizedBox(
                height: 20,
              ),
              const HomeGridViewWidget(),
            ],
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: VerseOfTheDayContainerWidget(),
          ),
        ),
      ],
    );
  }
}
