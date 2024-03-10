import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/sevices/date_sevice.dart';
import 'package:muslim_app/features/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/location_home_builder_widget.dart';

import 'widgets/home_row_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        Future.delayed(const Duration(seconds: 1)).then(
          (value) {
            LocationCubit.get(context).getLocationAddress();
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            const LocationHomeBuilderWidget(),
            HomeRowWidget(
              lable: DateSevice.jHijriDate,
              icon: Ionicons.calendar_outline,
            )
          ],
        ),
      ),
    );
  }
}
