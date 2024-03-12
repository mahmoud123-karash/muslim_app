import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/views/azar_details_screen.dart';

class AzkarListViewWidget extends StatelessWidget {
  const AzkarListViewWidget({super.key, required this.list});
  final List<Zekr> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ListTile(
        tileColor: index.isEven
            ? appColor.withOpacity(0.3)
            : greyColor.withOpacity(0.3),
        onTap: () {
          navigateTo(
            context,
            AzkarDetailsScreen(
              title: AzkarCubit.get(context).categories[index],
            ),
          );
        },
        title: Text(
          AzkarCubit.get(context).categories[index],
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: AzkarCubit.get(context).categories.length,
    );
  }
}
