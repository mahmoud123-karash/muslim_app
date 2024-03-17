import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/utils/get_it.dart';
import 'package:muslim_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:muslim_app/features/nav_bar/presentation/views/navbar_screen.dart';
import 'package:muslim_app/features/profile/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:muslim_app/features/profile/presentation/manager/delete_account_cubit/delete_account_states.dart';
import 'package:muslim_app/features/settings/presenation/manager/logout_cubit/logout_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

class RemoveDialogtDialogWidget extends StatefulWidget {
  const RemoveDialogtDialogWidget({super.key});

  @override
  State<RemoveDialogtDialogWidget> createState() =>
      _RemoveDialogtDialogWidgetState();
}

class _RemoveDialogtDialogWidgetState extends State<RemoveDialogtDialogWidget> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: AlertDialog(
        title: Text(
          S.of(context).delete_account,
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.bold,
            color: secondColor,
          ),
        ),
        content: Text(
          isDone
              ? S.of(context).re_auth_account
              : S.of(context).delete_account_question,
          style: TextStyles.style15.copyWith(
            color: appColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          BlocBuilder<DeleteAccountCubit, DeleteAccountStates>(
            builder: (context, state) {
              if (state is LoadingDeleteAccountState) {
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
          if (!isDone)
            BlocConsumer<DeleteAccountCubit, DeleteAccountStates>(
              listener: (context, state) {
                if (state is SuccessDeleteAccountState) {
                  LogoutCubit.get(context).logout();
                  navigateToAndFinish(context, const NavBarScreen());
                }
                if (state is ErrorDeleteAccountState) {
                  isDone = true;
                  setState(() {});
                }
              },
              builder: (context, state) {
                if (state is LoadingDeleteAccountState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return TextButton(
                    style: const ButtonStyle(
                      shadowColor: MaterialStatePropertyAll(Colors.red),
                    ),
                    onPressed: () {
                      DeleteAccountCubit.get(context).deleteAccount();
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
      ),
    );
  }
}
