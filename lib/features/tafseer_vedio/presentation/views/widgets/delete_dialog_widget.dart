import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/prayer_cubit/video_cubit.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/prayer_cubit/video_states.dart';
import 'package:muslim_app/generated/l10n.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget(
      {super.key, required this.uid, required this.tafseerTitle});
  final String uid, tafseerTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        tafseerTitle,
        style: TextStyles.style13.copyWith(
          fontWeight: FontWeight.bold,
          color: secondColor,
        ),
      ),
      content: Text(
        S.of(context).delete_tafseer_question,
        style: TextStyles.style15.copyWith(
          color: appColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        BlocBuilder<VideoCubit, VideoStates>(
          builder: (context, state) {
            if (state is LoadingGetVideosState) {
              return Container();
            } else {
              return TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.of(context).cancel),
              );
            }
          },
        ),
        BlocConsumer<VideoCubit, VideoStates>(
          listener: (context, state) {
            if (state is SuccessGetVideosState) {
              Navigator.pop(context);
              showSnackBar(context, S.of(context).success_delete);
            }
            if (state is ErrorGetVideosState) {
              showToast(state.message);
              VideoCubit.get(context).getData();
            }
          },
          builder: (context, state) {
            if (state is LoadingGetVideosState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TextButton(
                style: const ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () {
                  VideoCubit.get(context).removeTafseer(uid: uid);
                },
                child: Text(
                  S.of(context).delete,
                  style: TextStyles.style13.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
