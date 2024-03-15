import 'package:flutter/material.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/core/utils/lists.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';
import 'reciter_item_widge.dart';

class ReciterGridViewWidget extends StatelessWidget {
  const ReciterGridViewWidget({super.key, required this.reciters});
  final List<ReciterEntity> reciters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 9 / 10,
      ),
      itemCount: reciters.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReciterItemWidget(
          text: reciters[index].name,
          image: recitersImage[index],
          sText: readStyle(reciters[index].style),
          id: reciters[index].id,
        ),
      ),
    );
  }
}
