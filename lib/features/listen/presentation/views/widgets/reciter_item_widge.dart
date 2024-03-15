import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/listen/presentation/views/files_audio_screen.dart';
import 'package:muslim_app/generated/l10n.dart';

class ReciterItemWidget extends StatelessWidget {
  const ReciterItemWidget({
    super.key,
    required this.text,
    required this.image,
    required this.sText,
    required this.id,
  });
  final String text;
  final String image;
  final String sText;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (id != 0) {
          if (id == 8) {
            showSnackBar(context, S.of(context).soon);
          } else {
            navigateTo(
              context,
              FilesAudioScreen(
                id: id,
                reciterName: text,
                image: image,
                style: sText == '' ? '' : sText,
              ),
            );
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: appColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyles.style15.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Text(
                sText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: secondColor,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
