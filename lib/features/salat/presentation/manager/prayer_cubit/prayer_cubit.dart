import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/utils/lists.dart';
import 'package:muslim_app/features/salat/data/models/prayer_model/prayer_model.dart';
import 'prayer_states.dart';

class PrayerCubit extends Cubit<PrayerStates> {
  PrayerCubit() : super(InitailPrayerState());
  static PrayerCubit get(context) => BlocProvider.of(context);

  PrayerModel? nextPrayer;

  List<PrayerModel> getPrayersModels({
    required List<String> times,
    required int day,
    required BuildContext context,
  }) {
    var now = DateTime.now();
    List<PrayerModel> list = [];
    for (int i = 0; i < times.length; i++) {
      PrayerModel model = PrayerModel(
        name: salatNames(context)[i],
        icon: salatImags[i],
        dateTime: extractFormatedTime(times[i], day),
      );
      list.add(model);
    }
    if (day == now.day) {
      nextPrayer =
          list.where((element) => element.dateTime.isAfter(now)).toList().first;
    }
    emit(SuccessGetNexPrayerState());
    return list;
  }
}
