import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:muslim_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:muslim_app/features/nav_bar/presentation/views/widgets/nav_bar_widget.dart';

import 'widgets/badge_notification_icon_widget.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

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
