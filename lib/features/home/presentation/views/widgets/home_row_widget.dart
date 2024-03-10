import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/generated/l10n.dart';

class HomeRowWidget extends StatelessWidget {
  const HomeRowWidget({
    super.key,
    required this.lable,
    required this.icon,
    this.onPressed,
  });
  final String lable;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: appColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: width / 2),
            child: Text(
              lable,
              style: TextStyles.style14.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          ),
          if (onPressed != null) const Spacer(),
          if (onPressed != null)
            InkWell(
              onTap: onPressed,
              child: Text(
                S.of(context).update,
                style: TextStyles.style13.copyWith(
                  color: appColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
