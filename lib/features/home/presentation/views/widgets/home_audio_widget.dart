import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/listen/presentation/views/widgets/paly_and_skip_widget.dart';

import 'home_audio_image_widget.dart';

class HomeAudioWidget extends StatelessWidget {
  const HomeAudioWidget({
    super.key,
    required this.playTap,
    required this.skipNextTap,
    required this.skipPreviousTap,
    required this.isplay,
    required this.image,
    required this.stext,
  });
  final VoidCallback playTap;
  final VoidCallback skipNextTap;
  final VoidCallback skipPreviousTap;
  final bool isplay;
  final String image;
  final String stext;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.imagesRegister),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blackColor.withOpacity(0.7),
            ),
            width: width,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                HomeAudioImageWidget(image: image),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        stext,
                        style: TextStyles.style20.copyWith(
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                          fontFamily: uthmanic2Family,
                        ),
                      ),
                      PalyAndSkipWidget(
                        isHome: true,
                        playTap: playTap,
                        skipNextTap: skipNextTap,
                        skipPreviousTap: skipPreviousTap,
                        isplay: isplay,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
