import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/favorite_azkar_icon_builder_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class AzkarActionRowWidget extends StatelessWidget {
  const AzkarActionRowWidget({super.key, required this.zekr});
  final Zekr zekr;

  @override
  Widget build(BuildContext context) {
    bool isDark = CacheHelper.getData(key: 'isdark') ?? false;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            share(title: S.of(context).azkar, text: zekr.zekr);
          },
          icon: Icon(
            Icons.share_outlined,
            color: appColor,
          ),
        ),
        IconButton(
          onPressed: () {
            copyToClipboard(context, zekr.zekr);
          },
          icon: Icon(
            Ionicons.copy_outline,
            color: appColor,
          ),
        ),
        FavoriteAzkarIconBuilderWidget(zekr: zekr),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor.withOpacity(0.50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  zekr.count,
                  style: TextStyles.style15.copyWith(
                    color: isDark ? whiteColor : appColor,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.repeat_rounded,
                  color: isDark ? whiteColor : appColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
