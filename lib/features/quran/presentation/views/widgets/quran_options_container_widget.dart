import 'package:flutter/material.dart';

import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/quran/presentation/views/quran_dua_screen.dart';

import 'package:muslim_app/features/quran/presentation/views/widgets/option_custom_button_widget.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/top_options_container_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class QuranOptionsContainerWidget extends StatelessWidget {
  const QuranOptionsContainerWidget(
      {super.key, required this.onPressed, required this.pageIndex});
  final VoidCallback onPressed;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: blackColor.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TopOptionsContainerWidget(
            onPressed: onPressed,
            pageIndex: pageIndex,
          ),
          Container(
            color: whiteColor,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: OptionCustomButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    lable: S.of(context).home,
                    icon: Icons.home_filled,
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: appColor,
                ),
                Expanded(
                  child: OptionCustomButtonWidget(
                    onPressed: () {
                      navigateTo(context, const QuranDuaScreen());
                    },
                    lable: S.of(context).quran_dua,
                    icon: Icons.menu_book_sharp,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
