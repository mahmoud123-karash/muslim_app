import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/features/navBar/presentation/manager/navbar_cubit/navbar_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key, required this.cubit});
  final NavBarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (value) {
            cubit.changeIndex(value);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.home_outline),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.settings_outline),
              label: S.of(context).settings,
            )
          ],
        ),
      ),
    );
  }
}
