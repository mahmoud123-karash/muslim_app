import 'package:flutter/material.dart';

import 'play_button_widget.dart';
import 'skip_widget.dart';
import 'package:intl/intl.dart';

class PalyAndSkipWidget extends StatelessWidget {
  const PalyAndSkipWidget(
      {super.key,
      required this.playTap,
      required this.skipNextTap,
      required this.skipPreviousTap,
      required this.isplay});
  final VoidCallback playTap;
  final VoidCallback skipNextTap;
  final VoidCallback skipPreviousTap;
  final bool isplay;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Intl.getCurrentLocale() == 'en';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SkipWidget(
          ontap: skipPreviousTap,
          icon: isEnglish ? Icons.skip_previous : Icons.skip_next,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: PlayButtonWidget(
            ontap: playTap,
            ispaly: isplay,
          ),
        ),
        SkipWidget(
          ontap: skipNextTap,
          icon: !isEnglish ? Icons.skip_previous : Icons.skip_next,
        ),
      ],
    );
  }
}
