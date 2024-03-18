import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/salat/presentation/manager/salat_cubit/salat_cubit.dart';
import 'package:muslim_app/features/salat/presentation/manager/salat_cubit/salat_states.dart';

import 'prayers_times_content_widget.dart';

class PrayersTimesContentBuilderWidget extends StatelessWidget {
  const PrayersTimesContentBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalatCubit, SalatStates>(
      builder: (context, state) {
        if (state is SuccessGetPrayersState) {
          return PrayerTimesContentWidget(prayers: state.list);
        } else if (state is ErrorGetPrayersState) {
          return MessageBuilderWidget(message: state.message);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
