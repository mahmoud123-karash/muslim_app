import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/salat/data/models/prayer_model/prayer_model.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_states.dart';

import 'next_salah_colum_widget.dart';

class NextsalahColumBuilerWidget extends StatelessWidget {
  const NextsalahColumBuilerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerCubit, PrayerStates>(
      builder: (context, state) {
        PrayerModel? model = PrayerCubit.get(context).nextPrayer;
        return model == null ? Container() : NextSalahColumWidget(model: model);
      },
    );
  }
}
