import 'package:flutter/material.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'text_data_widget.dart';

class CompassDataWidget extends StatelessWidget {
  const CompassDataWidget(
      {super.key, required this.direction, required this.qiblah});
  final double direction;
  final double qiblah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      child: Row(
        children: [
          TextDataWidget(
            text: S.of(context).real_nourth,
            direction: direction,
          ),
          const Spacer(),
          TextDataWidget(
            text: S.of(context).Kaaba,
            direction: qiblah,
          )
        ],
      ),
    );
  }
}
