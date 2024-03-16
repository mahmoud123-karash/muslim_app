import 'package:flutter/material.dart';
import 'play_button_widget.dart';
import 'skip_widget.dart';
import 'package:intl/intl.dart';

class PalyAndSkipWidget extends StatelessWidget {
  const PalyAndSkipWidget({
    super.key,
    required this.playTap,
    required this.skipNextTap,
    required this.skipPreviousTap,
    required this.isplay,
    this.isHome = false,
  });
  final VoidCallback playTap;
  final VoidCallback skipNextTap;
  final VoidCallback skipPreviousTap;
  final bool isplay, isHome;

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Intl.getCurrentLocale() == 'en';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SkipWidget(
          isHome: isHome,
          ontap: skipPreviousTap,
          icon: isEnglish ? Icons.skip_previous : Icons.skip_next,
        ),
        PlayButtonWidget(
          isHome: isHome,
          ontap: playTap,
          ispaly: isplay,
        ),
        SkipWidget(
          isHome: isHome,
          ontap: skipNextTap,
          icon: !isEnglish ? Icons.skip_previous : Icons.skip_next,
        ),
      ],
    );
  }
}
