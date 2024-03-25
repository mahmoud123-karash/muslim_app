import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/assets.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Image.asset(
      width: width / 1.8,
      Assets.imagesListen,
    );
  }
}
