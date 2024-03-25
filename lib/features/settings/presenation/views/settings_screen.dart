import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/messaging_service.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/features/auth/presentation/views/login_screen.dart';
import 'package:muslim_app/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:muslim_app/features/profile/presentation/manager/profile_cubit/profile_states.dart';
import 'package:muslim_app/features/settings/presenation/manager/logout_cubit/logout_cubit.dart';
import 'package:muslim_app/features/settings/presenation/manager/logout_cubit/logout_states.dart';
import 'package:muslim_app/features/settings/presenation/views/about_app_screen.dart';
import 'package:muslim_app/features/settings/presenation/views/language_screen.dart';
import 'package:muslim_app/features/settings/presenation/views/widgets/profile_container_widget.dart';
import 'package:muslim_app/features/settings/presenation/views/widgets/settings_list_tile_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

import '../manager/manage_cubit/manage_cubit.dart';
import 'widgets/logout_dialog_widget.dart';
import 'widgets/switch_list_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutStates>(
      builder: (context, state) {
        String email = CacheHelper.getData(key: 'email') ?? '';
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: ListView(
            children: [
              if (email != '')
                BlocBuilder<ProfileCubit, ProfileStates>(
                  builder: (context, state) {
                    UserModel user = getUser();
                    return ProfileContainerWidget(user: user);
                  },
                ),
              SwitchListTileWidget(
                isEnabled: CacheHelper.getData(key: 'sub') ?? false,
                icon: Ionicons.notifications_outline,
                lable: S.of(context).notifications,
                onChanged: () {
                  bool isSub = CacheHelper.getData(key: 'sub') ?? false;
                  if (isSub) {
                    MessagingService.unSubscribeToTopic();
                  } else {
                    MessagingService.subscribeToTopic();
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SwitchListTileWidget(
                isEnabled: CacheHelper.getData(key: 'isdark') ?? false,
                icon: Icons.light_mode_outlined,
                lable: S.of(context).theme,
                onChanged: () {
                  ManageCubit.get(context).changeAppTheme();
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: S.of(context).language,
                icon: Ionicons.language_outline,
                onTap: () {
                  navigateTo(context, const LanguageScreen());
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: S.of(context).share_app,
                icon: Ionicons.share_social_outline,
                onTap: () {
                  share(
                    title: 'Muslim App',
                    text: 'كل مايخص ديننا الحنيف ستجده هنا',
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: S.of(context).rate_app,
                icon: Ionicons.star_outline,
                onTap: () {
                  Uri uri = Uri.parse(appLink);
                  openUri(url: uri);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: S.of(context).about_app,
                icon: Ionicons.information_circle_outline,
                onTap: () {
                  navigateTo(context, const AboutAppScreen());
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: S.of(context).contact_us,
                icon: Icons.email_outlined,
                onTap: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'elkhodaryehab@gmail.com',
                  );
                  openUri(url: emailLaunchUri);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: S.of(context).privacy_and_policy,
                icon: Icons.privacy_tip_outlined,
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              SettingsListTileWidget(
                title: email == '' ? S.of(context).login : S.of(context).logout,
                icon: email == ''
                    ? Ionicons.log_in_outline
                    : Ionicons.log_out_outline,
                onTap: () {
                  if (email == '') {
                    navigateTo(context, const LoginScreen());
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const LogoutDialogWidget(),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
