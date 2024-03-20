import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/services/messaging_service.dart';
import 'package:muslim_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:muslim_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:muslim_app/features/nav_bar/presentation/views/widgets/nav_bar_widget.dart';

import 'widgets/badge_notification_icon_widget.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  void didChangeDependencies() {
    MessagingService.onMessage(context: context);
    MessagingService.getintil(context);
    MessagingService.onMessageOpenedApp(context: context);
    MessagingService.listenNotification(context);
    bool? isSub = CacheHelper.getData(key: 'sub');
    if (isSub == null) {
      MessagingService.subscribeToTopic();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          NavBarCubit cubit = NavBarCubit.get(context);
          return PopScope(
            canPop: cubit.currentIndex == 0 ? true : false,
            onPopInvoked: (didPop) {
              if (cubit.currentIndex != 0) {
                cubit.changeIndex(0);
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: cubit.titles(context)[cubit.currentIndex],
                actions: const [
                  BadgeNotificationIconWidget(),
                ],
              ),
              bottomNavigationBar: NavBarWidget(cubit: cubit),
              body: cubit.screens[cubit.currentIndex],
            ),
          );
        },
      ),
    );
  }
}
