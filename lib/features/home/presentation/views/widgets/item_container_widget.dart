import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/generated/l10n.dart';

class ItemContainerWidget extends StatelessWidget {
  const ItemContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Image.asset(Assets.imagesPrayer),
              ),
              Text(
                S.of(context).home,
                style: TextStyles.style14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
