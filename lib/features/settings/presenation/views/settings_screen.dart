import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/settings/presenation/manager/manage_cubit/manage_cubit.dart';
import 'package:muslim_app/features/settings/presenation/views/language_screen.dart';
import 'package:muslim_app/features/settings/presenation/views/widgets/settings_list_tile_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/switch_list_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: ListView(
        children: [
          SwitchListTileWidget(
            icon: Ionicons.notifications_outline,
            lable: S.of(context).notifications,
            onChanged: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          SwitchListTileWidget(
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
            title: S.of(context).share,
            icon: Ionicons.share_social_outline,
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          SettingsListTileWidget(
            title: S.of(context).rate_app,
            icon: Ionicons.star_outline,
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          SettingsListTileWidget(
            title: S.of(context).about_app,
            icon: Ionicons.information_circle_outline,
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          SettingsListTileWidget(
            title: S.of(context).contact_us,
            icon: Ionicons.phone_portrait_outline,
            onTap: () {},
          ),
          const SizedBox(
            height: 12,
          ),
          SettingsListTileWidget(
            title: S.of(context).privacy_and_policy,
            icon: Icons.privacy_tip_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
