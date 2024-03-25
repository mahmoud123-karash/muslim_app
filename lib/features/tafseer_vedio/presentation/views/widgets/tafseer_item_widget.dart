import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/tafseer_details_screen.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/tafseer_name_and_date_colum_widget.dart';
import 'package:intl/intl.dart';
import 'delete_icon_button_widget.dart';
import 'edit_icon_button_widget.dart';
import 'youtube_manager.dart';

class TafseerItemWidget extends StatelessWidget {
  const TafseerItemWidget(
      {super.key, required this.model, required this.isDetails});
  final TafseerVideoModel model;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    String email = CacheHelper.getData(key: 'email') ?? "";
    bool isArabic = Intl.getCurrentLocale() == 'ar';
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        if (isDetails) {
          navigateToAndReplace(context, TafseerDeatilsScreen(model: model));
        } else {
          navigateTo(context, TafseerDeatilsScreen(model: model));
        }
      },
      child: Stack(
        children: [
          Container(
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
          if (email == adminEmail)
            if (!isDetails)
              Positioned(
                top: 0,
                right: isArabic ? 0 : null,
                left: !isArabic ? 0 : null,
                child: DeleteIconButtonWidget(
                  uid: model.uid!,
                  tafseerTitle: model.tafseerTitle,
                ),
              ),
          if (email == adminEmail)
            if (!isDetails)
              Positioned(
                bottom: 0,
                right: !isArabic ? 0 : null,
                left: isArabic ? 0 : null,
                child: EditIconButtonWidget(
                  model: model,
                ),
              ),
        ],
      ),
    );
  }
}
