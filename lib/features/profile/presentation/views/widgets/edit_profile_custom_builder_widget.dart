import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/custom_button_widget.dart';
import 'package:muslim_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:muslim_app/features/profile/presentation/manager/profile_cubit/profile_states.dart';
import 'package:muslim_app/generated/l10n.dart';

class EditProfileCustomBuilderWidget extends StatelessWidget {
  const EditProfileCustomBuilderWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is ErrorUpdateProfileState) {
          showSnackBar(context, state.message);
        }

        if (state is SuccessUpdateProfileState) {
          showSnackBar(context, S.of(context).success_update);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is LoadingUpdateProfileState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return CustomButtonWidget(
            lable: S.of(context).save,
            onPressed: onPressed,
          );
        }
      },
    );
  }
}
