import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:muslim_app/features/salat/presentation/manager/salat_cubit/salat_cubit.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/prayers_times_content_builder_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class PrayersTimesScreen extends StatelessWidget {
  const PrayersTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerCubit(),
      child: Scaffold(
        appBar: appAppBar(S.of(context).prayer_times),
        body: RefreshIndicator(
          onRefresh: () async {
            Future.delayed(const Duration(milliseconds: 250)).then(
              (value) {
                SalatCubit.get(context).getPrayers(isUpdate: true);
              },
            );
          },
          child: const PrayersTimesContentBuilderWidget(),
        ),
      ),
    );
  }
}
