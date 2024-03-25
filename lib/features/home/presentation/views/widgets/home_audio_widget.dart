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
    required this.surahName,
    required this.reciterName,
  });
  final VoidCallback playTap;
  final VoidCallback skipNextTap;
  final VoidCallback skipPreviousTap;
  final bool isplay;
  final String surahName, reciterName;

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
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blackColor.withOpacity(0.7),
            ),
            width: width,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const HomeAudioImageWidget(),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surahName,
                        style: TextStyles.style20.copyWith(
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                          fontFamily: uthmanic2Family,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        reciterName,
                        style: TextStyles.style16Bold.copyWith(
                          fontWeight: FontWeight.bold,
                          color: secondColor,
                          fontFamily: uthmanic2Family,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
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
