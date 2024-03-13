import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/views/azkar_details_screen.dart';

class AzkarListViewWidget extends StatelessWidget {
  const AzkarListViewWidget(
      {super.key, required this.list, required this.length});
  final List<Zekr> list;
  final int length;

  @override
  Widget build(BuildContext context) {
    List<String> categories = [];
    for (var element in list) {
      if (!categories.contains(element.category)) {
        categories.add(element.category);
      }
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < length) {
          return ListTile(
            tileColor: index.isEven
                ? appColor.withOpacity(0.3)
                : greyColor.withOpacity(0.3),
            onTap: () {
              navigateTo(
                context,
                AzkarDetailsScreen(
                  title: categories[index],
                ),
              );
            },
            title: Text(
              categories[index],
              style: TextStyles.style15.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          );
        } else {
          return Container();
        }
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: categories.length <= length ? categories.length : length + 1,
    );
  }
}
