import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';

class SwitchListTileWidget extends StatefulWidget {
  const SwitchListTileWidget({
    super.key,
    required this.lable,
    required this.onChanged,
    required this.icon,
  });
  final String lable;
  final Function onChanged;
  final IconData icon;

  @override
  State<SwitchListTileWidget> createState() => _SwitchListTileWidgetState();
}

class _SwitchListTileWidgetState extends State<SwitchListTileWidget> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: SwitchListTile(
        tileColor: appColor.withOpacity(0.2),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        secondary: Icon(
          widget.icon,
          color: appColor,
        ),
        title: Text(
          widget.lable,
          style: TextStyles.style15.copyWith(
            fontWeight: FontWeight.w600,
            color: appColor,
          ),
        ),
        value: isActive,
        onChanged: (value) {
          isActive = value;
          setState(() {});
          widget.onChanged();
        },
      ),
    );
  }
}
