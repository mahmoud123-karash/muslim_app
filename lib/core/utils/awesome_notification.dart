import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/services/services.dart';

void initializeNotifications() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'reminder_channel_group',
        channelKey: 'reminder_channel',
        channelName: 'reminder notifications',
        channelDescription: 'Notification channel for water reminder',
        defaultColor: appColor,
        ledColor: Colors.white,
      ),
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: appColor,
        ledColor: Colors.white,
      )
    ],
    debug: true,
  );
}

void setRepedtedNotification({
  required int secondes,
  required String title,
}) async {
  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 200000,
      channelKey: 'reminder_channel',
      actionType: ActionType.Default,
      title: title,
      notificationLayout: NotificationLayout.BigPicture,
      category: NotificationCategory.Reminder,
      bigPicture: 'asset://assets/images/water_cover.jpg',
      autoDismissible: false,
      fullScreenIntent: true,
      wakeUpScreen: true,
    ),
    schedule: NotificationInterval(
      interval: secondes,
      timeZone: localTimeZone,
      preciseAlarm: true,
      repeats: true,
    ),
  );
}

void setNotification({
  required String title,
  required String body,
  required int id,
  required int hour,
  required int minute,
}) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: 'reminder_channel',
      actionType: ActionType.Default,
      title: title,
      body: body,
      notificationLayout: NotificationLayout.BigPicture,
      category: NotificationCategory.Reminder,
      bigPicture: 'asset://assets/images/water_cover.jpg',
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

void cancelNotification({required int id}) async {
  await AwesomeNotifications().cancel(id);
}

void listenNotification() {
  AwesomeNotifications().setListeners(
    onActionReceivedMethod: (receivedAction) {
      if (receivedAction.channelKey == 'reminder_channel') {
      } else if (receivedAction.channelKey == 'basic_channel') {}
      return Future.value();
    },
    onNotificationDisplayedMethod: (receivedNotification) {
      if (receivedNotification.channelKey == 'basic_channel') {}
      if (receivedNotification.channelKey == 'reminder_channel') {}

      return Future.value();
    },
  );
}
