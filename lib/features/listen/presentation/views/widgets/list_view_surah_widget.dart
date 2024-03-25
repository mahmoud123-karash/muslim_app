import 'package:flutter/material.dart';
import 'package:muslim_app/features/listen/presentation/manager/audio_cubit/audio_cubit.dart';
import 'item_surah_builder_widget.dart';

class ListViewSurahWidget extends StatefulWidget {
  const ListViewSurahWidget({
    super.key,
    required this.name,
    required this.id,
    required this.server,
    required this.surahList,
  });

  final String name;
  final int id;
  final String server;
  final List<String> surahList;

  @override
  State<ListViewSurahWidget> createState() => _ListViewSurahWidgetState();
}

class _ListViewSurahWidgetState extends State<ListViewSurahWidget> {
  @override
  void initState() {
    AudioCubit.get(context).getFilePath(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemBuilder: (context, index) => ItemSurahBuilderWidget(
          url:
              '${widget.server}${getSurahNum(int.parse(widget.surahList[index]))}.mp3',
          name: widget.name,
          id: widget.id,
          surahNum: widget.surahList[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: widget.surahList.length,
      ),
    );
  }
}

String getSurahNum(int originalNum) {
  if (originalNum < 10) {
    return '00$originalNum';
  } else if (originalNum < 100) {
    return '0$originalNum';
  } else {
    return '$originalNum';
  }
}
