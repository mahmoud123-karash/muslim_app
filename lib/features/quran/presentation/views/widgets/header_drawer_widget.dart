import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'drawer_custom_item_widget.dart';

class HeaderDrawerWidget extends StatelessWidget {
  const HeaderDrawerWidget({
    super.key,
    required this.ontapS,
    required this.ontapJ,
    required this.index,
  });
  final VoidCallback ontapS;
  final VoidCallback ontapJ;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: DrawerCustomItemWidget(
              ontap: ontapS,
              text: S.of(context).al_surahs,
              color: index == 1 ? whiteColor : appColor,
              tColor: index == 1 ? greyColor : whiteColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: DrawerCustomItemWidget(
              ontap: ontapJ,
              text: S.of(context).al_juzs,
              color: index == 0 ? whiteColor : appColor,
              tColor: index == 0 ? greyColor : whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
