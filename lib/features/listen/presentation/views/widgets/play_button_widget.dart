import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    super.key,
    required this.ontap,
    required this.ispaly,
  });
  final VoidCallback ontap;
  final bool ispaly;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: secondColor.withOpacity(0.5),
      child: IconButton(
        onPressed: ontap,
        icon: Icon(
          ispaly ? Icons.equalizer : Icons.play_arrow,
          size: ispaly ? 30 : 50,
          color: appColor,
        ),
      ),
    );
  }
}
