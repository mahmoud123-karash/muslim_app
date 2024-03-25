import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';

import 'widgets/header_drawer_widget.dart';
import 'widgets/juz_list_view_widget.dart';
import 'widgets/mark_widget.dart';
import 'widgets/surah_list_view_widget.dart';

class QuranDrawerWidget extends StatefulWidget {
  const QuranDrawerWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<QuranDrawerWidget> createState() => _MosafDrawerWidgetState();
}

class _MosafDrawerWidgetState extends State<QuranDrawerWidget> {
  int? index;
  int? mark;
  @override
  void initState() {
    index = CacheHelper.getData(key: 'sj') ?? 0;
    mark = CacheHelper.getData(key: 'saveMark') ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width - 120,
      child: PageStorage(
        bucket: pageBuket,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  if (mark != 0)
                    MarkWidget(
                      mark: mark ?? 0,
                      pageController: widget.pageController,
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  HeaderDrawerWidget(
                    index: index!,
                    ontapS: () {
                      setState(() {
                        index = 0;
                        saveSurahOrJuz(0);
                      });
                    },
                    ontapJ: () {
                      setState(() {
                        index = 1;
                        saveSurahOrJuz(1);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Expanded(
              child: index == 1
                  ? JuzListViewWidget(
                      pageController: widget.pageController,
                    )
                  : SurahListViewWidget(
                      pageController: widget.pageController,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
