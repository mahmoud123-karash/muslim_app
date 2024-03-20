import 'package:flutter/material.dart';
import 'package:muslim_app/features/notification/data/models/notification_model.dart';
import 'package:muslim_app/features/notification/presentation/views/widgets/notification_item_widget.dart';

class NotificationListViewWidget extends StatelessWidget {
  const NotificationListViewWidget(
      {super.key,
      required this.list,
      required this.controller,
      required this.length});
  final List<NotificationModel> list;
  final ScrollController controller;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.separated(
        controller: controller,
        itemBuilder: (context, index) => NotificationItemWidget(
          model: list[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: list.length <= length ? list.length : length + 1,
      ),
    );
  }
}
