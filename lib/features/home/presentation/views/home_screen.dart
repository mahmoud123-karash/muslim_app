import 'package:flutter/material.dart';

import 'widgets/badge_notification_icon_widget.dart';
import 'widgets/home_app_bar_title_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HomeAppBarTiltleWidget(),
        actions: const [
          BadgeNotificationIconWidget(),
        ],
      ),
    );
  }
}
