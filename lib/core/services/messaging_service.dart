import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingService {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void subscribeToTopic() async {
    await firebaseMessaging.subscribeToTopic('azkar');
    log('sub');
  }

  void unSubscribeToTopic() async {
    await firebaseMessaging.unsubscribeFromTopic('azkar');
    log('unsub');
  }
}
