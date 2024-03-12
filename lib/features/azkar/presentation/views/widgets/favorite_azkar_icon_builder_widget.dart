import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/manager/favorite_cubit/favorite_states.dart';

class FavoriteAzkarIconBuilderWidget extends StatelessWidget {
  const FavoriteAzkarIconBuilderWidget({super.key, required this.zekr});
  final Zekr zekr;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        if (state is SuccessGetFavorite) {
          bool isContains = state.list.contains(zekr);
          return IconButton(
            onPressed: () {
              if (isContains) {
                FavoriteCubit.get(context).deleteFavoriteAzkar(model: zekr);
              } else {
                FavoriteCubit.get(context).addFavoriteAzkar(model: zekr);
              }
            },
            icon: Icon(
              isContains ? Ionicons.heart : Ionicons.heart_outline,
              color: isContains ? secondColor : appColor,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
