import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/lists.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/juz_item_widget.dart';

class JuzListViewWidget extends StatelessWidget {
  const JuzListViewWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListView.separated(
        padding: const EdgeInsets.all(0),
        key: const PageStorageKey<String>('pageOne'),
        itemCount: 30,
        itemBuilder: (context, index) => JuzItemWidget(
          text: juzNames[index],
          juzNumber: index + 1,
          pageController: pageController,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
