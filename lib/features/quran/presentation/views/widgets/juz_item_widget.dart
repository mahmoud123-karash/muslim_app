import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';

class JuzItemWidget extends StatelessWidget {
  const JuzItemWidget({
    super.key,
    required this.text,
    required this.juzNumber,
    required this.pageController,
  });
  final String text;
  final int juzNumber;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          pageController.jumpToPage(navigateToFirstPage(juzNumber));
          QuranCubit.get(context).closeDrawer();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondColor.withOpacity(0.4),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyles.style15.copyWith(
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
