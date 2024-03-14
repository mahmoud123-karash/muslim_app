import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

import '../../manager/quran_cubit/quran_states.dart';

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
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    onPressed();
                    QuranCubit.get(context).openDrawer();
                  },
                  icon: Icon(
                    Ionicons.menu_sharp,
                    color: appColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.home_filled,
                    color: appColor,
                  ),
                ),
                BlocBuilder<QuranCubit, QuranStates>(
                  builder: (context, state) {
                    int cachedPage = CacheHelper.getData(key: 'saveMark') ?? 0;
                    return IconButton(
                      onPressed: () {
                        onPressed();
                        if (cachedPage == pageIndex) {
                          QuranCubit.get(context).removeMarkPage();
                          showSnackBar(
                              context, S.of(context).remove_the_book_mark);
                        } else {
                          QuranCubit.get(context).saveMarkPage(pageIndex);
                          showSnackBar(context, S.of(context).save_book_mark);
                        }
                      },
                      icon: Icon(
                        cachedPage == pageIndex
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: cachedPage == pageIndex ? secondColor : appColor,
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Ionicons.search_outline,
                    color: appColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
