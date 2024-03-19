import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/salat/data/models/prayer_model/prayer_model.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_cubit.dart';
import 'package:muslim_app/features/salat/presentation/manager/prayer_cubit/prayer_states.dart';
import 'package:intl/intl.dart';
import 'next_salah_colum_widget.dart';

class NextsalahColumBuilerWidget extends StatelessWidget {
  const NextsalahColumBuilerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<PrayerCubit, PrayerStates>(
      builder: (context, state) {
        DateTime now = DateTime.now();
        PrayerModel? model = PrayerCubit.get(context).nextPrayer;
        DateTime time =
            DateTime(now.year, now.month, PrayerCubit.get(context).day);
        return model == null
            ? SizedBox(
                height: height / 3,
                child: Center(
                  child: Text(
                    DateFormat.yMMMEd().format(time),
                    style: TextStyles.style15.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : NextSalahColumWidget(model: model);
      },
    );
  }
}
