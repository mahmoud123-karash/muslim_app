import 'package:flutter/material.dart';

class SwitchListTileWidget extends StatefulWidget {
  const SwitchListTileWidget({
    super.key,
    required this.lable,
    required this.onChanged,
    required this.icon,
    required this.isEnabled,
  });
  final String lable;
  final Function onChanged;
  final IconData icon;
  final bool isEnabled;

  @override
  State<SwitchListTileWidget> createState() => _SwitchListTileWidgetState();
}

class _SwitchListTileWidgetState extends State<SwitchListTileWidget> {
  bool isActive = false;
  @override
  void initState() {
    isActive = widget.isEnabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: SwitchListTile(
        secondary: Icon(
          widget.icon,
        ),
        title: Text(
          widget.lable,
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
