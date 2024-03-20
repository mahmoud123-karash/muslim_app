import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_states.dart';
import 'package:muslim_app/features/notification/presentation/views/notification_screen.dart';

class BadgeNotificationIconWidget extends StatefulWidget {
  const BadgeNotificationIconWidget({super.key});

  @override
  State<BadgeNotificationIconWidget> createState() =>
      _BadgeNotificationIconWidgetState();
}

class _BadgeNotificationIconWidgetState
    extends State<BadgeNotificationIconWidget> {
  late int badge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          badge = 0;
          setState(() {});
          navigateTo(context, const NotificationScreen());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: appColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<NotificationCubit, NotificationStates>(
              builder: (context, state) {
                if (state is SuccessGetNotificationssState) {
                  int count = state.list.length;
                  int length = CacheHelper.getData(key: 'length') ?? 0;
                  badge = count - length;
                  return badge == 0
                      ? const NotificationIconWidget()
                      : badges.Badge(
                          position:
                              badges.BadgePosition.topEnd(top: -10, end: -5),
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
                          child: const NotificationIconWidget(),
                        );
                } else {
                  return const NotificationIconWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationIconWidget extends StatelessWidget {
  const NotificationIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Ionicons.notifications_outline,
      size: 25,
    );
  }
}
