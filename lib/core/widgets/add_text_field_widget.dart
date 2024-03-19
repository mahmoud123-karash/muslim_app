import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/generated/l10n.dart';

class AddTextFieldWidget extends StatelessWidget {
  const AddTextFieldWidget(
      {super.key,
      required this.controller,
      required this.autovalidateMode,
      required this.lable});
  final TextEditingController controller;
  final AutovalidateMode autovalidateMode;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      autovalidateMode: autovalidateMode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).validate;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyles.style14.copyWith(
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
      ),
    );
  }
}
