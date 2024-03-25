import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/assets.dart';

class HomeAudioImageWidget extends StatelessWidget {
  const HomeAudioImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(Assets.imagesListen),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
