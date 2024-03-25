import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class OptionCustomButtonWidget extends StatelessWidget {
  const OptionCustomButtonWidget(
      {super.key,
      required this.lable,
      required this.icon,
      required this.onPressed});
  final String lable;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: appColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: width / 3.5),
            child: Text(
              lable,
              style: TextStyles.style13.copyWith(
                fontWeight: FontWeight.bold,
                color: appColor,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
