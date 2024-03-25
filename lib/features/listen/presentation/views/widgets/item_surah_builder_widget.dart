import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/features/listen/presentation/views/widgets/item_surrah_widget.dart';
import 'package:muslim_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:muslim_app/features/listen/presentation/manager/player_cubit/player_states.dart';

class ItemSurahBuilderWidget extends StatelessWidget {
  const ItemSurahBuilderWidget({
    super.key,
    required this.name,
    required this.id,
    required this.surahNum,
    required this.url,
  });
  final String name, surahNum, url;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerStates>(
      builder: (context, state) {
        bool isplay = CacheHelper.getData(key: 'ispaly') ?? false;
        return ItemSurahWidget(
          url: url,
          surahNum: int.parse(surahNum),
          name: name,
          isPlay: isplay,
          id: id,
        );
      },
    );
  }
}
