import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.lable,
    required this.onPressed,
  });
  final String lable;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: MaterialButton(
        color: appColor,
        minWidth: width,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            lable,
            style: TextStyles.style17.copyWith(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
