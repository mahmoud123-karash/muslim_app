import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/add_custom_buttom_widget.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/notification/data/models/notification_model.dart';
import 'package:muslim_app/features/notification/presentation/views/send_notification_screen.dart';
import 'package:muslim_app/features/notification/presentation/views/widgets/notification_list_view_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class NotificationContentWidget extends StatefulWidget {
  const NotificationContentWidget({super.key, required this.list});
  final List<NotificationModel> list;

  @override
  State<NotificationContentWidget> createState() =>
      _NotificationContentWidgetState();
}

class _NotificationContentWidgetState extends State<NotificationContentWidget> {
  ScrollController scrollController = ScrollController();
  List<NotificationModel> searchList = [];

  int length = 10;

  @override
  void initState() {
    saveLength(widget.list.length);
    scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (widget.list.length > length) {
        length += 10;
        Future.delayed(const Duration(seconds: 1)).then((value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() {});
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = CacheHelper.getData(key: 'email') ?? "";
    return Column(
      children: [
        if (email == adminEmail)
          AddCustomButtonWidget(
            icon: Ionicons.notifications_outline,
            lable: S.of(context).send_new_notification,
            onPressed: () {
              navigateTo(context, const SendNotificationScreen());
            },
          ),
        Expanded(
          child: widget.list.isEmpty
              ? MessageBuilderWidget(message: S.of(context).no_results)
              : NotificationListViewWidget(
                  controller: scrollController,
                  length: length,
                  list: widget.list,
                ),
        )
      ],
    );
  }
}
