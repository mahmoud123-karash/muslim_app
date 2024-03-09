import 'package:flutter/material.dart';

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
        onTap: onTap,
        title: Text(
          title,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
        leading: Icon(
          icon,
        ),
      ),
    );
  }
}
