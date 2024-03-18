import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/widgets/custom_button_widget.dart';
import 'package:muslim_app/features/salat/presentation/manager/salat_cubit/salat_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

class ErrorBuilderWidget extends StatelessWidget {
  const ErrorBuilderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyles.style15.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomButtonWidget(
            lable: S.of(context).try_again,
            onPressed: () {
              SalatCubit.get(context).getPrayers(isUpdate: true);
            },
          ),
        ),
      ],
    );
  }
}
