import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
    required this.name,
    required this.isPlay,
    required this.id,
    required this.surahNum,
    required this.url,
  });
  final int surahNum;
  final String name, url;
  final int id;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Intl.getCurrentLocale() == 'en';
    return BlocBuilder<QuranCubit, QuranStates>(
      builder: (context, state) {
        List<Surah> list = QuranCubit.get(context).surahs;
        if (list.isNotEmpty) {
          String surahName = isEnglish
              ? list[surahNum - 1].englishName
              : list[surahNum - 1].arabicName;
          return GestureDetector(
            onTap: () async {
              if (AudioCubit.get(context).isDownloading) {
                showSnackBar(context, S.of(context).download_waiting);
              } else {
                AudioCubit.get(context).index = surahNum;
                if (await File(
                  '${(await getTemporaryDirectory()).path}$surahNum $id',
                ).exists()) {
                  if (AudioCubit.get(context).isDownloading) {
                    showSnackBar(context, S.of(context).download_waiting);
                  } else {
                    saveReciterName(name);
                    saveSurahName(surahName);
                    navigateTo(
                      context,
                      PlayerScreen(isHome: false, id: id, index: surahNum),
                    );
                  }
                } else {
                  if (await InternetConnectionChecker().hasConnection) {
                    AudioCubit.get(context).downloadAudio(
                      url: url,
                      surahNum: surahNum,
                      reciterId: id,
                      context: context,
                    );
                  } else {
                    showSnackBar(context, S.of(context).no_connection);
                  }
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
                      surahNum: surahNum,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SvgPicture.asset(
                      'assets/svg/surah_name/00$surahNum.svg',
                      height: 45,
                      colorFilter: ColorFilter.mode(
                        appColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const Spacer(),
                    ProgressDownloadBuilderWidget(
                      index: surahNum,
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
