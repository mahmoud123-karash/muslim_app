import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/utils/get_it.dart';
import 'package:muslim_app/features/listen/domain/use_cases/download_use_case.dart';
import 'package:muslim_app/features/listen/presentation/manager/audio_cubit/audio_cubit.dart';
import 'package:muslim_app/features/listen/presentation/views/widgets/list_view_surah_widget.dart';

class SurahListScreen extends StatelessWidget {
  const SurahListScreen({
    super.key,
    required this.id,
    required this.reciterName,
    required this.server,
    required this.surahList,
  });
  final int id;
  final String reciterName;
  final String server;
  final List<String> surahList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit(
        getIt.get<DownloadUseCase>(),
      ),
      child: Scaffold(
        appBar: appAppBar(reciterName),
        body: ListViewSurahWidget(
          name: reciterName,
          id: id,
          server: server,
          surahList: surahList,
        ),
      ),
    );
  }
}
