import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_cubit.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_states.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/tafseer_list_view_widget.dart';
import 'package:muslim_app/generated/l10n.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TafseerDeatilsScreen extends StatefulWidget {
  const TafseerDeatilsScreen({
    super.key,
    required this.model,
  });
  final TafseerVideoModel model;

  @override
  State<TafseerDeatilsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<TafseerDeatilsScreen> {
  late YoutubePlayerController controller;
  late String videoId;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;
  bool isPlayerReady = false;
  @override
  void initState() {
    videoId = YoutubePlayer.convertUrlToId(widget.model.vedioUri)!;
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
    super.initState();
  }

  void listener() {
    if (isPlayerReady && mounted && !controller.value.isFullScreen) {
      setState(() {
        playerState = controller.value.playerState;
        videoMetaData = controller.metadata;
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (PlayerCubit.get(context).isPaly) {
      PlayerCubit.get(context).stopAudio();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets systemPadding = MediaQuery.of(context).padding;
    final height = MediaQuery.of(context).size.height;
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: SystemUiOverlay.values,
        );
      },
      player: YoutubePlayer(
        onReady: () {
          isPlayerReady = true;
          setState(() {});
        },
        onEnded: (metaData) {
          controller.pause();
          setState(() {});
        },
        controller: controller,
        aspectRatio: 16 / 7,
      ),
      builder: (context, player) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: systemPadding.top + systemPadding.bottom,
            ),
            SizedBox(
              width: double.infinity,
              height: height / 3,
              child: player,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.model.tafseerTitle,
                style: TextStyles.style15.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.model.personName,
                style: TextStyles.style15.copyWith(
                  fontWeight: FontWeight.bold,
                  color: secondColor,
                ),
              ),
            ),
            const Divider(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                S.of(context).more_videos,
                style: TextStyles.style16Bold.copyWith(
                  fontWeight: FontWeight.bold,
                  color: appColor,
                ),
              ),
            ),
            BlocBuilder<VideoCubit, VideoStates>(
              builder: (context, state) {
                if (state is SuccessGetVideosState) {
                  List<TafseerVideoModel> list = state.list
                      .where((element) =>
                          element.tafseerTitle != widget.model.tafseerTitle)
                      .toList();
                  return Expanded(
                    child: list.isEmpty
                        ? MessageBuilderWidget(
                            message: S.of(context).no_results)
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TafseerListViewWidegt(
                              controller: ScrollController(),
                              isDetails: true,
                              list: list,
                              length: 10,
                            ),
                          ),
                  );
                } else {
                  return Expanded(
                    child: MessageBuilderWidget(
                      message: S.of(context).no_results,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
