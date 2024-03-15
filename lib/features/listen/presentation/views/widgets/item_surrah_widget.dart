import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_states.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/surah_num_stack_widget.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/listen/presentation/manager/audio_cubit/audio_cubit.dart';
import 'package:muslim_app/features/listen/presentation/views/player_screen.dart';
import 'package:muslim_app/features/listen/presentation/views/widgets/progress_download_builder_widget.dart';
import '../../../../../core/cache/save_data.dart';
import '../../../../../core/contants/constants.dart';

class ItemSurahWidget extends StatelessWidget {
  const ItemSurahWidget({
    super.key,
    required this.index,
    required this.image,
    required this.name,
    required this.cacheUrl,
    required this.isPlay,
    required this.id,
  });
  final int index;
  final String image;
  final String name;
  final int id;
  final String cacheUrl;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranStates>(
      builder: (context, state) {
        List<Surah> list = QuranCubit.get(context).surahs;
        if (list.isNotEmpty) {
          return GestureDetector(
            onTap: () async {
              AudioCubit.get(context).index = index;
              if (await File(
                '${(await getTemporaryDirectory()).path}$index $id',
              ).exists()) {
                if (AudioCubit.get(context).isDownloading) {
                  showSnackBar(context, 'يرجي الإنتظار لإكمال التنزيل');
                } else {
                  saveReciterImage(image);
                  saveReciterName(name);
                  saveSurahName(list[index].arabicName);
                  navigateTo(
                    context,
                    PlayerScreen(isHome: false, id: id, index: index),
                  );
                }
              } else {
                if (await InternetConnectionChecker().hasConnection) {
                  AudioCubit.get(context).downloadAudio(
                    surahIndex: index,
                    id: id,
                    context: context,
                  );
                } else {
                  showSnackBar(context, S.of(context).no_connection);
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: secondColor.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SurahNumStackWidget(
                      surah: list[index],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      Intl.getCurrentLocale() == 'ar'
                          ? list[index].arabicName
                          : list[index].englishName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: uthmanic2Family,
                      ),
                    ),
                    const Spacer(),
                    ProgressDownloadBuilderWidget(
                      index: index,
                      isPlay: isPlay,
                      id: id,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
