import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/custom_button_widget.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_cubit.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_states.dart';
import 'package:muslim_app/generated/l10n.dart';

class AddTafseerCustomButtonWidget extends StatelessWidget {
  const AddTafseerCustomButtonWidget(
      {super.key, required this.onPressed, required this.lable});
  final VoidCallback onPressed;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCubit, VideoStates>(
      listener: (context, state) {
        if (state is ErrorGetVideosState) {
          showSnackBar(context, state.message);
          VideoCubit.get(context).getData();
        }
        if (state is SuccessGetVideosState) {
          Navigator.pop(context);
          showSnackBar(context, S.of(context).add_success);
        }
      },
      builder: (context, state) {
        if (state is LoadingGetVideosState) {
          return const CircularProgressIndicator();
        } else {
          return CustomButtonWidget(
            lable: lable,
            onPressed: onPressed,
          );
        }
      },
    );
  }
}
