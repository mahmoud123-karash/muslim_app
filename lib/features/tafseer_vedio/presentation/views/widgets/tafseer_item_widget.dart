import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/tafseer_details_screen.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/tafseer_name_and_date_colum_widget.dart';

import 'youtube_manager.dart';

class TafseerItemWidget extends StatelessWidget {
  const TafseerItemWidget(
      {super.key, required this.model, required this.isDetails});
  final TafseerVideoModel model;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        if (isDetails) {
          navigateToAndReplace(context, TafseerDeatilsScreen(model: model));
        } else {
          navigateTo(context, TafseerDeatilsScreen(model: model));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appColor.withOpacity(0.2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: YoutubeManager(
                      youtubeUrl: model.vedioUri,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              TafseerNameAndDateColumWidegt(model: model),
            ],
          ),
        ),
      ),
    );
  }
}
