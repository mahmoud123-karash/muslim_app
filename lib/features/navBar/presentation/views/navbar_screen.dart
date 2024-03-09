import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/navBar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:muslim_app/features/navBar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:muslim_app/features/navBar/presentation/views/widgets/nav_bar_widget.dart';

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
              bottomNavigationBar: NavBarWidget(cubit: cubit),
              body: cubit.screens[cubit.currentIndex],
            ),
          );
        },
      ),
    );
  }
}
