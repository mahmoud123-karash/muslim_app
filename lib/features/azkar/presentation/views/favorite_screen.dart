import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/azkar/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/manager/favorite_cubit/favorite_states.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/azkar_details_item_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorite_azkar),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteStates>(
        builder: (context, state) {
          if (state is SuccessGetFavorite) {
            if (state.list.isEmpty) {
              return MessageBuilderWidget(
                message: S.of(context).no_favorite_azkar,
              );
            }
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return AzkarDetailsItemWidget(
                    zekr: state.list[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: state.list.length,
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
