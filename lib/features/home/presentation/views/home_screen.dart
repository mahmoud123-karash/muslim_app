import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/services/date_service.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/home_audio_builder_widget.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/location_home_builder_widget.dart';

import 'widgets/home_grid_view_widget.dart';
import 'widgets/home_row_widget.dart';
import 'widgets/verse_of_the_day_builder_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Intl.getCurrentLocale() == 'en';
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const LocationHomeBuilderWidget(),
              HomeRowWidget(
                lable: isEnglish
                    ? DateSevice.dateFormatted
                    : DateSevice.arJHijriDate,
                icon: Ionicons.calendar_outline,
              ),
              const SizedBox(
                height: 20,
              ),
              const HomeAudioBuilderWidget(),
              const SizedBox(
                height: 20,
              ),
              const HomeGridViewWidget(),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: VerseOfTheDayBuilderWidget(),
          ),
        ),
      ],
    );
  }
}
