import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';

class SettingsListTileWidget extends StatelessWidget {
  const SettingsListTileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: ListTile(
        tileColor: appColor.withOpacity(0.2),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        onTap: onTap,
        title: Text(
          title,
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.w600,
            color: appColor,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColor,
        ),
        leading: Icon(
          icon,
          color: appColor,
        ),
      ),
    );
  }
}
