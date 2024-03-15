import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';

class NameTextWidget extends StatelessWidget {
  const NameTextWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 22,
        fontFamily: uthmanic2Family,
      ),
    );
  }
}
