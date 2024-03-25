import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_cubit.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_states.dart';
import 'package:muslim_app/features/quran/presentation/views/quran_drawer_widget.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/quran_options_container_widget.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/quran_pages_widget.dart';

import 'widgets/top_title_widget.dart';
import 'package:intl/intl.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  bool isShown = false;
  late PageController pageController;
  @override
  void initState() {
    int pageIndex = CacheHelper.getData(key: 'pageIndex') ?? 0;
    pageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    bool isDark = CacheHelper.getData(key: 'isdark') ?? false;
    return Scaffold(
      backgroundColor: isDark ? null : const Color(0xffFAF5ED),
      key: QuranCubit.get(context).quranKey,
      drawer: QuranDrawerWidget(
        pageController: pageController,
      ),
      body: BlocBuilder<QuranCubit, QuranStates>(
        builder: (context, state) {
          var cubit = QuranCubit.get(context);
          if (cubit.pages.isEmpty) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return GestureDetector(
              onTap: () {
                isShown = !isShown;
                setState(() {});
              },
              child: SafeArea(
                child: SizedBox(
                  height: height,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      savepageIndex(value);
                    },
                    itemCount: 604,
                    reverse: Intl.getCurrentLocale() == 'en' ? true : false,
                    padEnds: false,
                    scrollDirection: Axis.horizontal,
                    physics: isShown
                        ? const NeverScrollableScrollPhysics()
                        : const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          if (index != 0 && index != 1)
                            Align(
                              alignment: Alignment.topCenter,
                              child: TopTitleWidget(
                                pageIndex: index,
                                surahName: Intl.getCurrentLocale() == 'en'
                                    ? QuranCubit.get(context)
                                        .getSurahEnglishNameFromPage(index)
                                    : QuranCubit.get(context)
                                        .getSurahNameFromPage(index),
                                juzNum: QuranCubit.get(context)
                                    .getJuzByPage(index)
                                    .juz,
                              ),
                            ),
                          Align(
                            alignment: Alignment.center,
                            child: QuranPagesWidget(
                              pageIndex: index,
                              cubit: cubit,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text(
                                '${Intl.getCurrentLocale() == 'en' ? index + 1 : getArabicNumber(index + 1)}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'naskh',
                                  color: secondColor,
                                ),
                              ),
                            ),
                          ),
                          if (isShown)
                            QuranOptionsContainerWidget(
                              onPressed: () {
                                isShown = !isShown;
                                setState(() {});
                              },
                              pageIndex: index,
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
