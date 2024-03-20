import 'package:flutter/material.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/tafseer_item_widget.dart';

class TafseerListViewWidegt extends StatelessWidget {
  const TafseerListViewWidegt(
      {super.key,
      required this.list,
      required this.length,
      required this.isDetails,
      required this.controller});
  final List<TafseerVideoModel> list;
  final int length;
  final bool isDetails;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        if (index < length) {
          return TafseerItemWidget(
            isDetails: isDetails,
            model: list[index],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: list.length <= length ? list.length : length + 1,
    );
  }
}
