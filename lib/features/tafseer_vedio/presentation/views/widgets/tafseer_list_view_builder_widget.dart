import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_cubit.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_states.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/tafseer_content_widget.dart';

class TafseerContentBuilderWidget extends StatelessWidget {
  const TafseerContentBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoStates>(
      builder: (context, state) {
        if (state is SuccessGetVideosState) {
          return TafseerContentWidget(list: state.list);
        } else if (state is ErrorGetVideosState) {
          return MessageBuilderWidget(message: state.message);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
