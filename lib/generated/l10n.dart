// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `تسجبل الدخول`
  String get login {
    return Intl.message(
      'تسجبل الدخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `تسجبل الخروج`
  String get logout {
    return Intl.message(
      'تسجبل الخروج',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcome_back {
    return Intl.message(
      'Welcome back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get language {
    return Intl.message(
      'App Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Share and Earn Rewards`
  String get share_app {
    return Intl.message(
      'Share and Earn Rewards',
      name: 'share_app',
      desc: '',
      args: [],
    );
  }

  /// `Rate the App`
  String get rate_app {
    return Intl.message(
      'Rate the App',
      name: 'rate_app',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get about_app {
    return Intl.message(
      'About the App',
      name: 'about_app',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy and Policy`
  String get privacy_and_policy {
    return Intl.message(
      'Privacy and Policy',
      name: 'privacy_and_policy',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic_language {
    return Intl.message(
      'Arabic',
      name: 'arabic_language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english_language {
    return Intl.message(
      'English',
      name: 'english_language',
      desc: '',
      args: [],
    );
  }

  /// `Device Language`
  String get device_language {
    return Intl.message(
      'Device Language',
      name: 'device_language',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get confirm_lang {
    return Intl.message(
      'Apply',
      name: 'confirm_lang',
      desc: '',
      args: [],
    );
  }

  /// `تحديث`
  String get update {
    return Intl.message(
      'تحديث',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `مشاركة`
  String get share {
    return Intl.message(
      'مشاركة',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `آية اليوم`
  String get aya_of_the_day {
    return Intl.message(
      'آية اليوم',
      name: 'aya_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `القرآن الكريم`
  String get quran_kareem {
    return Intl.message(
      'القرآن الكريم',
      name: 'quran_kareem',
      desc: '',
      args: [],
    );
  }

  /// `التفسير المرئي`
  String get tafsser_video {
    return Intl.message(
      'التفسير المرئي',
      name: 'tafsser_video',
      desc: '',
      args: [],
    );
  }

  /// `القبلة`
  String get qibla {
    return Intl.message(
      'القبلة',
      name: 'qibla',
      desc: '',
      args: [],
    );
  }

  /// `مواقيت الصلاة`
  String get prayer_times {
    return Intl.message(
      'مواقيت الصلاة',
      name: 'prayer_times',
      desc: '',
      args: [],
    );
  }

  /// `الأذكار`
  String get azkar {
    return Intl.message(
      'الأذكار',
      name: 'azkar',
      desc: '',
      args: [],
    );
  }

  /// `الإستماع إلي القرآن`
  String get listen_to_quran {
    return Intl.message(
      'الإستماع إلي القرآن',
      name: 'listen_to_quran',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
