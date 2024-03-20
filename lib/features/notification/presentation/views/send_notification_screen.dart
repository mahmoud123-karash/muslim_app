import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/custom_button_widget.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_states.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/send_notification_content_widget.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final TextEditingController titleContoller = TextEditingController();
  final TextEditingController textContoller = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleContoller.text = 'إشعار جديد';
    super.initState();
  }

  @override
  void dispose() {
    titleContoller.dispose();
    textContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(S.of(context).send_new_notification),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SendNotificationContentWidget(
              titleContoller: titleContoller,
              textContoller: textContoller,
              autovalidateMode: autovalidateMode,
              formKey: formKey,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BlocConsumer<NotificationCubit, NotificationStates>(
                listener: (context, state) {
                  if (state is ErrorGetNotificationssState) {
                    showSnackBar(context, state.message);
                    NotificationCubit.get(context).getData();
                  }

                  if (state is SuccessGetNotificationssState) {
                    showSnackBar(context, S.of(context).send_success);
                    textContoller.clear();
                    titleContoller.text = 'إشعار جديد';
                    setState(() {});
                  }
                },
                builder: (context, state) {
                  if (state is LoadingGetNotificationssState) {
                    return const CircularProgressIndicator();
                  } else {
                    return CustomButtonWidget(
                      lable: S.of(context).send,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          NotificationCubit.get(context).sendNotification(
                            text: textContoller.text,
                            title: titleContoller.text,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
