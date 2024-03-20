import 'package:flutter/material.dart';
import 'package:muslim_app/features/notification/presentation/views/widgets/notification_item_widget.dart';

class NotificationListViewWidget extends StatelessWidget {
  const NotificationListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.separated(
        itemBuilder: (context, index) => const NotificationItemWidget(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 50,
      ),
    );
  }
}
