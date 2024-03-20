import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/features/notification/data/models/notification_model.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, required this.model});
  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: secondColor.withOpacity(0.4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          model.text,
          style: TextStyles.style16Bold.copyWith(
            fontWeight: FontWeight.bold,
            color: appColor,
          ),
        ),
      ),
    );
  }
}
