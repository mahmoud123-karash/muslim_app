import 'package:flutter/material.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';
import 'package:muslim_app/features/listen/presentation/views/widgets/reciter_list_tile_item_widget.dart';

class RecitersListViewWidget extends StatelessWidget {
  const RecitersListViewWidget({super.key, required this.list});
  final List<ReciterEntity> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          itemBuilder: (context, index) => ReciterListTileItemWidget(
            reciter: list[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: list.length,
        ),
      ),
    );
  }
}
