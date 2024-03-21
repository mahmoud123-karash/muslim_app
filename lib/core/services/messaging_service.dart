import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/next_prayer.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/notification/presentation/manager/notification_cubit/notification_cubit.dart';
import 'package:muslim_app/features/notification/presentation/views/notification_screen.dart';
import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';
import 'package:muslim_app/features/salat/presentation/views/prayer_times_screen.dart';

abstract class MessagingService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static void subscribeToTopic() async {
    await firebaseMessaging.subscribeToTopic('azkar');
    saveSub(true);
    log('sub');
  }

  static void unSubscribeToTopic() async {
    await firebaseMessaging.unsubscribeFromTopic('azkar');
    saveSub(false);
    log('unsub');
  }

  static void onMessage({
    required BuildContext context,
  }) {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        NotificationCubit.get(context).getData();
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: message.notification.hashCode,
            channelKey: 'azkar_topic_channel',
            actionType: ActionType.Default,
            title: message.notification!.title,
            body: message.notification!.body,
          ),
        );
      },
    );
  }

  static void onMessageOpenedApp({required BuildContext context}) {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        navigateTo(context, const NotificationScreen());
      },
    );
  }

  static void getintil(context) async {
    RemoteMessage? remoteMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      navigateTo(context, const NotificationScreen());
    } else {
      log("No Message");
    }
  }

  static void initializeAwesomeNotifications() {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'azkar_topic_group',
          channelKey: 'azkar_topic_channel',
          channelName: 'azkar notifications',
          channelDescription: 'Notification channel for azkar',
          defaultColor: appColor,
          ledColor: Colors.white,
        ),
        NotificationChannel(
          channelGroupKey: 'salat_group',
          channelKey: 'salat_channel',
          channelName: 'salat notifications',
          channelDescription: 'Notification channel for salat',
          defaultColor: appColor,
          ledColor: Colors.white,
        )
      ],
      debug: true,
    );
  }

  static void setNotification({
    required String title,
    required String body,
    required int id,
    required int hour,
    required int minute,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'salat_channel',
        actionType: ActionType.Default,
        title: title,
        body: body,
        notificationLayout: NotificationLayout.BigPicture,
        category: NotificationCategory.Reminder,
        bigPicture: 'asset://assets/images/register.jpeg',
        autoDismissible: false,
        fullScreenIntent: true,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar.fromDate(
        date: nextScheduledDate(
          hour,
          minute,
        ),
        preciseAlarm: true,
        repeats: true,
      ),
    );
  }

  static void cancelNotification({required int id}) async {
    await AwesomeNotifications().cancel(id);
  }

  static void listenNotification(BuildContext context) {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) {
        if (receivedAction.channelKey == 'salat_channel') {
          navigateTo(context, const PrayersTimesScreen());
        } else if (receivedAction.channelKey == 'azkar_topic_channel') {
          navigateTo(context, const NotificationScreen());
        }
        return Future.value();
      },
      onNotificationDisplayedMethod: (receivedNotification) {
        if (receivedNotification.channelKey == 'salat_channel') {
          var box = Hive.box<SalatEntity>(salatBox);
          List<SalatEntity> list = box.values.toList();
          setNextPrayerNotification(list);
        }
        if (receivedNotification.channelKey == 'azkar_topic_channel') {}

        return Future.value();
      },
    );
  }
}
