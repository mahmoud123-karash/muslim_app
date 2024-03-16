import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class NameAndEmailColumWidget extends StatelessWidget {
  const NameAndEmailColumWidget(
      {super.key, required this.name, required this.email});
  final String name, email;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: width / 2),
          child: Text(
            name,
            style: TextStyles.style15.copyWith(
              color: appColor,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: width / 2),
          child: Text(
            email,
            style: TextStyles.style13.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
