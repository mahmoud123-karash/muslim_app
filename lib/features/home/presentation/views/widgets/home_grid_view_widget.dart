import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/utils/lists.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/item_container_widget.dart';
import 'package:muslim_app/features/qibla/presentation/views/qibla_screen.dart';
import 'package:muslim_app/features/quran/presentation/views/quran_screen.dart';

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
          onPressed: () {
            navigateTo(context, const QiblaScreen());
          },
          image: images[index],
        ),
        itemCount: 6,
      ),
    );
  }
}
