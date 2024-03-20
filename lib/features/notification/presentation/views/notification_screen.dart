import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_states.dart';
import 'package:muslim_app/features/notification/presentation/views/widgets/notification_content_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(S.of(context).notifications),
      body: BlocBuilder<NotificationCubit, NotificationStates>(
        builder: (context, state) {
          if (state is SuccessGetNotificationssState) {
            return NotificationContentWidget(list: state.list);
          } else if (state is ErrorGetNotificationssState) {
            return MessageBuilderWidget(message: state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
