import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/settings/presenation/manager/logout_cubit/logout_cubit.dart';
import 'package:muslim_app/features/settings/presenation/manager/logout_cubit/logout_states.dart';
import 'package:muslim_app/generated/l10n.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.of(context).logout,
        style: TextStyles.style15.copyWith(
          fontWeight: FontWeight.bold,
          color: secondColor,
        ),
      ),
      content: Text(
        S.of(context).logout_question,
        style: TextStyles.style15.copyWith(
          color: appColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        BlocBuilder<LogoutCubit, LogoutStates>(
          builder: (context, state) {
            if (state is LoadingLogoutState) {
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
        BlocConsumer<LogoutCubit, LogoutStates>(
          listener: (context, state) {
            if (state is SuccessLogoutState) {
              Navigator.pop(context);
            }
            if (state is ErrorLogoutState) {
              showToast(state.message);
            }
          },
          builder: (context, state) {
            if (state is LoadingLogoutState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return TextButton(
                style: const ButtonStyle(
                  shadowColor: MaterialStatePropertyAll(Colors.red),
                ),
                onPressed: () {
                  LogoutCubit.get(context).logout();
                },
                child: Text(
                  S.of(context).logout_ok,
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
