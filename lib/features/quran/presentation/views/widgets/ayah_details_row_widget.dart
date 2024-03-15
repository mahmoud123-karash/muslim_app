import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_cubit.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_states.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/ayah_details_options_container_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class AyahDetailsRowWidget extends StatelessWidget {
  const AyahDetailsRowWidget(
      {super.key, required this.ayah, required this.tafseerTap});
  final Ayah ayah;
  final VoidCallback tafseerTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AyahDetailsOptionsContainerWidget(
            lable: S.of(context).tafsser_ayah,
            icon: Icons.language,
            onPressed: tafseerTap,
          ),
          const SizedBox(
            width: 5,
          ),
          BlocConsumer<AyahCubit, AyahStates>(
            listener: (context, state) {
              if (state is ErrorPlayAudioState) {
                showToast(state.message);
              }
            },
            builder: (context, state) {
              var cubit = AyahCubit.get(context);
              return AyahDetailsOptionsContainerWidget(
                lable: S.of(context).listen_ayah,
                icon: cubit.isPaly ? Icons.equalizer_rounded : Icons.play_arrow,
                onPressed: () {
                  if (cubit.isPaly) {
                    cubit.pauseAudio();
                  } else {
                    cubit.playAudio(
                      uri: ayah.audio,
                      context: context,
                      message: S.of(context).no_connection,
                    );
                  }
                },
              );
            },
          ),
          const SizedBox(
            width: 5,
          ),
          AyahDetailsOptionsContainerWidget(
            lable: S.of(context).copy_ayah,
            icon: Icons.copy,
            onPressed: () {
              copyToClipboard(context, ayah.text);
            },
          ),
          const SizedBox(
            width: 5,
          ),
          AyahDetailsOptionsContainerWidget(
            lable: S.of(context).share_ayah,
            icon: Icons.share,
            onPressed: () {
              share(title: ayah.ayahNumber.toString(), text: ayah.text);
            },
          ),
        ],
      ),
    );
  }
}
