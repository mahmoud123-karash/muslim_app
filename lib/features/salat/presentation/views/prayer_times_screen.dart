import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:muslim_app/features/salat/presentation/views/widgets/prayers_times_content_builder_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class PrayersTimesScreen extends StatelessWidget {
  const PrayersTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).prayer_times),
          centerTitle: true,
        ),
        body: const PrayersTimesContentBuilderWidget(),
      ),
    );
  }
}
