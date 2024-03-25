import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';
import 'package:muslim_app/features/listen/presentation/views/surah_list_screen.dart';

class ReciterListTileItemWidget extends StatelessWidget {
  const ReciterListTileItemWidget({super.key, required this.reciter});
  final ReciterEntity reciter;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        navigateTo(
          context,
          SurahListScreen(
            id: reciter.reciterId,
            reciterName: reciter.reciterName,
            server: reciter.rewaya!.server!,
            surahList: reciter.rewaya!.surahList!.split(','),
          ),
        );
      },
      title: Text(
        reciter.reciterName,
        style: TextStyles.style15.copyWith(
          color: secondColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        reciter.rewaya!.name ?? 'حفص عن عاصم - مرتل',
        style: TextStyles.style17.copyWith(
          fontWeight: FontWeight.bold,
          fontFamily: uthmanic2Family,
        ),
      ),
      trailing: Image.asset(
        height: 40,
        width: 50,
        Assets.imagesListen,
        fit: BoxFit.contain,
      ),
    );
  }
}
