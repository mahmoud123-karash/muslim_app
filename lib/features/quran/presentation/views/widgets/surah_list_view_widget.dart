import 'package:flutter/material.dart';
import 'list_tile_surah_widget.dart';

class SurahListViewWidget extends StatelessWidget {
  const SurahListViewWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        key: const PageStorageKey<String>('pageTwo'),
        itemCount: 114,
        itemBuilder: (context, index) {
          return ListTileSurahWidget(
            index: index,
            pageController: pageController,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
