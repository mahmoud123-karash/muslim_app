import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/notification/presentation/views/notification_screen.dart';

class BadgeNotificationIconWidget extends StatelessWidget {
  const BadgeNotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          navigateTo(context, const NotificationScreen());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -5),
              ignorePointer: true,
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                badgeColor: secondColor,
                elevation: 0,
              ),
              badgeContent: Text(
                '',
                style: TextStyle(
                  color: whiteColor,
                ),
              ),
              child: const Icon(
                Ionicons.notifications_outline,
                size: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
