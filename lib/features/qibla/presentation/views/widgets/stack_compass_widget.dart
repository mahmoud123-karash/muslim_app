import 'dart:math';

import 'package:flutter/material.dart';

import 'compass_image_widget.dart';
import 'needle_image_widget.dart';

class StackCompassWidget extends StatelessWidget {
  const StackCompassWidget(
      {super.key, required this.qiblah, required this.direction});
  final double qiblah;
  final double direction;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height / 2,
      width: width - 100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Transform.rotate(
            angle: ((direction) * (pi / 180) * -1),
            child: const CompassImageWidget(),
          ),
          Transform.rotate(
            angle: ((qiblah) * (pi / 180) * -1),
            alignment: Alignment.center,
            child: const NeedleImageWidget(),
          ),
        ],
      ),
    );
  }
}
