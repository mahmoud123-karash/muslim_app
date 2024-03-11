import 'package:flutter/material.dart';
import 'package:muslim_app/core/utils/lists.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/item_container_widget.dart';

class HomeGridViewWidget extends StatelessWidget {
  const HomeGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 5 / 6,
        ),
        itemBuilder: (context, index) => ItemContainerWidget(
          title: titles(context)[index],
          onPressed: () {},
          image: images[index],
        ),
        itemCount: 6,
      ),
    );
  }
}
