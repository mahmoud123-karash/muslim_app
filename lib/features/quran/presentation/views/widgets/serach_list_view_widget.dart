import 'package:flutter/material.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';

import 'serach_item_widget.dart';

class SearchListViewWidget extends StatelessWidget {
  const SearchListViewWidget({super.key, required this.list});
  final List<Ayah> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => SearchItemWidget(
        ayah: list[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: list.length,
    );
  }
}
