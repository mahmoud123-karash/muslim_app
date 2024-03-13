import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/generated/l10n.dart';

class ZekrOfTheDayContainerWidget extends StatelessWidget {
  const ZekrOfTheDayContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String zakr = CacheHelper.getData(key: 'zRandom') ?? '';
    return zakr == ''
        ? const SizedBox()
        : Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: secondColor.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.of(context).zakr_of_the_day,
                    style: TextStyles.style16Bold.copyWith(
                      fontWeight: FontWeight.bold,
                      color: secondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    zakr,
                    style: TextStyles.style20Bold.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: uthmanic2Family,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          copyToClipboard(context, zakr);
                        },
                        icon: const Icon(Ionicons.copy_outline),
                      ),
                      IconButton(
                        onPressed: () {
                          share(
                            title: S.of(context).zakr_of_the_day,
                            text: zakr,
                          );
                        },
                        icon: const Icon(
                          Icons.share_outlined,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
