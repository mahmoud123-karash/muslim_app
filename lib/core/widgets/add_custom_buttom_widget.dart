import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';

class AddCustomButtonWidget extends StatelessWidget {
  const AddCustomButtonWidget({
    super.key,
    required this.lable,
    required this.onPressed,
    this.icon = Icons.add_circle,
  });
  final String lable;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: whiteColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                lable,
                style: TextStyles.style17.copyWith(
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
