import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/quran/data/models/tafseer_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_cubit.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_states.dart';

class TafseerTextBuilderWidget extends StatelessWidget {
  const TafseerTextBuilderWidget({super.key, required this.ayahNum});
  final int ayahNum;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AyahCubit, AyahStates>(
      builder: (context, state) {
        List<Tasfseer> list = AyahCubit.get(context).list;
        return list.isEmpty
            ? const SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Text(
                AyahCubit.get(context).getTafsser(ayahNum),
                style: TextStyles.style20.copyWith(
                  fontFamily: uthmanic2Family,
                  letterSpacing: 0,
                  wordSpacing: 0,
                ),
                textAlign: TextAlign.justify,
              );
      },
    );
  }
}
