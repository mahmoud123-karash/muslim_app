import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/manager/azkar_cubit/azkar_states.dart';

import 'widgets/azkar_details_item_widget.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title),
      body: BlocBuilder<AzkarCubit, AzkarStates>(
        builder: (context, state) {
          if (state is SuccessLoadAzkar) {
            List<Zekr> list = state.list
                .where((element) => element.category == title)
                .toList();
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemBuilder: (context, index) => AzkarDetailsItemWidget(
                  zekr: list[index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: list.length,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
