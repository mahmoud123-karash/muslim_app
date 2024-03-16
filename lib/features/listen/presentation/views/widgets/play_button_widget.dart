import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:muslim_app/core/contants/constants.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    super.key,
    required this.ontap,
    required this.ispaly,
    required this.isHome,
  });
  final VoidCallback ontap;
  final bool ispaly, isHome;

  @override
  Widget build(BuildContext context) {
    return PlayAudioWidget(
      ontap: ontap,
      ispaly: ispaly,
    );
  }
}

class PlayAudioWidget extends StatelessWidget {
  const PlayAudioWidget({
    super.key,
    required this.ontap,
    required this.ispaly,
  });
  final VoidCallback ontap;
  final bool ispaly;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ontap,
      icon: ispaly
          ? Lottie.asset(
              'assets/lottie/play.json',
              height: 50,
              width: 50,
            )
          : Icon(
              ispaly ? Icons.equalizer : Icons.play_arrow,
              size: ispaly ? 30 : 50,
              color: appColor,
            ),
    );
  }
}
