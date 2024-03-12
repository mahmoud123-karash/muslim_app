import 'package:flutter/material.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/azkar_list_view_widget.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/zakr_of_the_day_container_widget.dart';

class AzkarContentWidget extends StatelessWidget {
  const AzkarContentWidget({super.key, required this.list});
  final List<Zekr> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ZakrOfTheDayContainerWidget(),
            const SizedBox(
              height: 20,
            ),
            AzkarListViewWidget(list: list),
          ],
        ),
      ),
    );
  }
}
