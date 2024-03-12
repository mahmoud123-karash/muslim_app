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

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
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

  /// `الإستماع للقرآن`
  String get listen_to_quran {
    return Intl.message(
      'الإستماع للقرآن',
      name: 'listen_to_quran',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our Islamic app, where you can explore the beauty of Islam and enhance your spiritual journey`
  String get on_boarding_1 {
    return Intl.message(
      'Welcome to our Islamic app, where you can explore the beauty of Islam and enhance your spiritual journey',
      name: 'on_boarding_1',
      desc: '',
      args: [],
    );
  }

  /// `Experience the tranquility and peace that comes from connecting with Allah (God) through our Islamic app's resources and features.`
  String get on_boarding_2 {
    return Intl.message(
      'Experience the tranquility and peace that comes from connecting with Allah (God) through our Islamic app\'s resources and features.',
      name: 'on_boarding_2',
      desc: '',
      args: [],
    );
  }

  /// `Embrace the teachings of Islam and incorporate them into your daily life with the help of our user-friendly Islamic app.`
  String get on_boarding_3 {
    return Intl.message(
      'Embrace the teachings of Islam and incorporate them into your daily life with the help of our user-friendly Islamic app.',
      name: 'on_boarding_3',
      desc: '',
      args: [],
    );
  }

  /// `التالي`
  String get next {
    return Intl.message(
      'التالي',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `السابق`
  String get previous {
    return Intl.message(
      'السابق',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `ابدأ الآن`
  String get start_now {
    return Intl.message(
      'ابدأ الآن',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `الإسم`
  String get name {
    return Intl.message(
      'الإسم',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `الهاتف`
  String get phone {
    return Intl.message(
      'الهاتف',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get pass {
    return Intl.message(
      'كلمة المرور',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور`
  String get confirm_pass {
    return Intl.message(
      'تأكيد كلمة المرور',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك تأكد من كلمة المرور`
  String get confirm_pass_hint_error {
    return Intl.message(
      'من فضلك تأكد من كلمة المرور',
      name: 'confirm_pass_hint_error',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك تأكد من رقم الهاتف`
  String get phone_lenght_hint_error {
    return Intl.message(
      'من فضلك تأكد من رقم الهاتف',
      name: 'phone_lenght_hint_error',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك قم بإختيار الجنس`
  String get gender_confirm_hint_error {
    return Intl.message(
      'من فضلك قم بإختيار الجنس',
      name: 'gender_confirm_hint_error',
      desc: '',
      args: [],
    );
  }

  /// `لديك حساب ؟`
  String get have_an_account {
    return Intl.message(
      'لديك حساب ؟',
      name: 'have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `ذكر`
  String get male {
    return Intl.message(
      'ذكر',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `أنثي`
  String get female {
    return Intl.message(
      'أنثي',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `هذا الحقل مطلوب`
  String get validate {
    return Intl.message(
      'هذا الحقل مطلوب',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `أو`
  String get or {
    return Intl.message(
      'أو',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `ليس لديك حساب؟`
  String get create {
    return Intl.message(
      'ليس لديك حساب؟',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب`
  String get create1 {
    return Intl.message(
      'إنشاء حساب',
      name: 'create1',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمة المرور`
  String get forget {
    return Intl.message(
      'نسيت كلمة المرور',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `المتابعه بدون تسجيل`
  String get follow {
    return Intl.message(
      'المتابعه بدون تسجيل',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك قم بتفعيل الايميل الخاص`
  String get email_verify {
    return Intl.message(
      'من فضلك قم بتفعيل الايميل الخاص',
      name: 'email_verify',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل`
  String get register {
    return Intl.message(
      'تسجيل',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `أدخل البريد الإلكتروني`
  String get reset_email {
    return Intl.message(
      'أدخل البريد الإلكتروني',
      name: 'reset_email',
      desc: '',
      args: [],
    );
  }

  /// `إعادة تعيين`
  String get reset {
    return Intl.message(
      'إعادة تعيين',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `الجزء`
  String get juz {
    return Intl.message(
      'الجزء',
      name: 'juz',
      desc: '',
      args: [],
    );
  }

  /// `دعاء اليوم`
  String get zakr_of_the_day {
    return Intl.message(
      'دعاء اليوم',
      name: 'zakr_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `تم النسخ`
  String get copied {
    return Intl.message(
      'تم النسخ',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `الأذكار المفضلة`
  String get favorite_azkar {
    return Intl.message(
      'الأذكار المفضلة',
      name: 'favorite_azkar',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد أذكار مفضلة`
  String get no_favorite_azkar {
    return Intl.message(
      'لا يوجد أذكار مفضلة',
      name: 'no_favorite_azkar',
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
