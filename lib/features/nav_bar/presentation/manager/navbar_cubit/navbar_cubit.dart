import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/home/presentation/views/home_screen.dart';
import 'package:muslim_app/features/nav_bar/presentation/manager/navbar_cubit/navbar_states.dart';
import 'package:muslim_app/features/settings/presenation/views/settings_screen.dart';
import 'package:muslim_app/generated/l10n.dart';

import '../../views/widgets/home_app_bar_title_widget.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(InitailNavBarState());
  static NavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexNavBarState());
  }

  final List<Widget> screens = [
    const HomeScreen(),
    const SettingsScreen(),
  ];

  List<Widget> titles(context) => [
        const HomeAppBarTiltleWidget(),
        Text(S.of(context).settings),
      ];
}
