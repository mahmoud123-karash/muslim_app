import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:muslim_app/features/listen/presentation/manager/player_cubit/player_states.dart';
import 'package:muslim_app/features/listen/presentation/views/player_screen.dart';
import '../../../../../generated/l10n.dart';
import 'home_audio_widget.dart';

class HomeAudioBuilderWidget extends StatefulWidget {
  const HomeAudioBuilderWidget({super.key});

  @override
  State<HomeAudioBuilderWidget> createState() => _HomeAudioBuilderWidgetState();
}

class _HomeAudioBuilderWidgetState extends State<HomeAudioBuilderWidget> {
  int? index;
  int? id;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          navigateTo(
              context,
              PlayerScreen(
                id: id!,
                index: index!,
                isHome: true,
              ));
        },
        child: BlocBuilder<PlayerCubit, PlayerStates>(
          builder: (context, state) {
            String sName = CacheHelper.getData(key: 'sName') ?? '';
            String image = CacheHelper.getData(key: 'rImage') ?? '';
            id = CacheHelper.getData(key: 'rindex') ?? 50;
            index = CacheHelper.getData(key: 'sindex') ?? 150;
            int cachedPoeition = CacheHelper.getData(key: 'position') ?? 0;

            var cubit = PlayerCubit.get(context);
            return index != 150
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).last_listen,
                        style: TextStyles.style15.copyWith(
                          fontWeight: FontWeight.bold,
                          color: appColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      HomeAudioWidget(
                        playTap: () {
                          log(cubit.isPaly.toString());
                          if (cubit.isPaly) {
                            cubit.stopAudio();
                          } else {
                            cubit.playAudio(
                              id: id!,
                              index: index!,
                              newposition: Duration(seconds: cachedPoeition),
                              context: context,
                            );
                          }
                        },
                        skipNextTap: () {
                          cubit.seekForward(
                            duration: const Duration(seconds: 10),
                            context: context,
                          );
                        },
                        skipPreviousTap: () {
                          cubit.seekBackward(
                            duration: const Duration(seconds: 10),
                            context: context,
                          );
                        },
                        isplay: cubit.isPaly,
                        image: image,
                        stext: sName,
                      ),
                    ],
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
