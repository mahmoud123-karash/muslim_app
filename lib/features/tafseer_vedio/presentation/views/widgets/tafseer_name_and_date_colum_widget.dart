import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class TafseerNameAndDateColumWidegt extends StatelessWidget {
  const TafseerNameAndDateColumWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 120,
      width: width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'mofjsogjdognsgshglsgslglghilggklsnklamavlkclzbphsjfianmshsifbuj',
            style: TextStyles.style14.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
          Text(
            'mofjsogjdognsgshglsgslglghilggklsnklamavlkclzbphsjfianmshsifbuj',
            style: TextStyles.style16Bold.copyWith(
              color: appColor,
            ),
            maxLines: 1,
          ),
          const Spacer(),
          Text(
            '10/12/2.24',
            style: TextStyles.style15.copyWith(
              color: secondColor,
            ),
          )
        ],
      ),
    );
  }
}
