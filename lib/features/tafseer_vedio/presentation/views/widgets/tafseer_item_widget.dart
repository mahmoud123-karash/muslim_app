import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/tafseer_name_and_date_colum_widget.dart';

class TafseerItemWidget extends StatelessWidget {
  const TafseerItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: appColor.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    Assets.imagesLogin,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const TafseerNameAndDateColumWidegt(),
          ],
        ),
      ),
    );
  }
}
