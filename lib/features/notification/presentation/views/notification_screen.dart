import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/add_custom_buttom_widget.dart';
import 'package:muslim_app/features/notification/presentation/views/widgets/notification_list_view_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(S.of(context).notifications),
      body: Column(
        children: [
          AddCustomButtonWidget(
            icon: Ionicons.notifications_outline,
            lable: S.of(context).send_new_notification,
            onPressed: () {},
          ),
          const Expanded(
            child: NotificationListViewWidget(),
          )
        ],
      ),
    );
  }
}
