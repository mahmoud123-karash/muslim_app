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

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Verse of the Day`
  String get aya_of_the_day {
    return Intl.message(
      'Verse of the Day',
      name: 'aya_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Quran Kareem`
  String get quran_kareem {
    return Intl.message(
      'Quran Kareem',
      name: 'quran_kareem',
      desc: '',
      args: [],
    );
  }

  /// `Visual Tafseer`
  String get tafsser_video {
    return Intl.message(
      'Visual Tafseer',
      name: 'tafsser_video',
      desc: '',
      args: [],
    );
  }

  /// `Qibla`
  String get qibla {
    return Intl.message(
      'Qibla',
      name: 'qibla',
      desc: '',
      args: [],
    );
  }

  /// `Prayer Times`
  String get prayer_times {
    return Intl.message(
      'Prayer Times',
      name: 'prayer_times',
      desc: '',
      args: [],
    );
  }

  /// `Adhkar`
  String get azkar {
    return Intl.message(
      'Adhkar',
      name: 'azkar',
      desc: '',
      args: [],
    );
  }

  /// `Listen to Quran`
  String get listen_to_quran {
    return Intl.message(
      'Listen to Quran',
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

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_pass {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirm_pass_hint_error {
    return Intl.message(
      'Please confirm your password',
      name: 'confirm_pass_hint_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check the phone number`
  String get phone_lenght_hint_error {
    return Intl.message(
      'Please check the phone number',
      name: 'phone_lenght_hint_error',
      desc: '',
      args: [],
    );
  }

  /// `Please select the gender`
  String get gender_confirm_hint_error {
    return Intl.message(
      'Please select the gender',
      name: 'gender_confirm_hint_error',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get have_an_account {
    return Intl.message(
      'Have an account?',
      name: 'have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get validate {
    return Intl.message(
      'This field is required',
      name: 'validate',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get create {
    return Intl.message(
      'Don\'t have an account?',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get create1 {
    return Intl.message(
      'Create an Account',
      name: 'create1',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forget {
    return Intl.message(
      'Forgot Password',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `Follow without Registration`
  String get follow {
    return Intl.message(
      'Follow without Registration',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Please activate your email`
  String get email_verify {
    return Intl.message(
      'Please activate your email',
      name: 'email_verify',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get reset_email {
    return Intl.message(
      'Enter your email',
      name: 'reset_email',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Juz`
  String get juz {
    return Intl.message(
      'Juz',
      name: 'juz',
      desc: '',
      args: [],
    );
  }

  /// `Dua of the Day`
  String get zakr_of_the_day {
    return Intl.message(
      'Dua of the Day',
      name: 'zakr_of_the_day',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Adhkar`
  String get favorite_azkar {
    return Intl.message(
      'Favorite Adhkar',
      name: 'favorite_azkar',
      desc: '',
      args: [],
    );
  }

  /// `No favorite Adhkar`
  String get no_favorite_azkar {
    return Intl.message(
      'No favorite Adhkar',
      name: 'no_favorite_azkar',
      desc: '',
      args: [],
    );
  }

  /// `صفحة`
  String get page {
    return Intl.message(
      'صفحة',
      name: 'page',
      desc: '',
      args: [],
    );
  }

  /// `متابعة القراءة من حيث توقفت`
  String get mark {
    return Intl.message(
      'متابعة القراءة من حيث توقفت',
      name: 'mark',
      desc: '',
      args: [],
    );
  }

  /// `متابعة`
  String get follow_reading {
    return Intl.message(
      'متابعة',
      name: 'follow_reading',
      desc: '',
      args: [],
    );
  }

  /// `السور`
  String get al_surahs {
    return Intl.message(
      'السور',
      name: 'al_surahs',
      desc: '',
      args: [],
    );
  }

  /// `الأجزاء`
  String get al_juzs {
    return Intl.message(
      'الأجزاء',
      name: 'al_juzs',
      desc: '',
      args: [],
    );
  }

  /// `تم حفظ علامة`
  String get save_book_mark {
    return Intl.message(
      'تم حفظ علامة',
      name: 'save_book_mark',
      desc: '',
      args: [],
    );
  }

  /// `تم حذف العلامة`
  String get remove_the_book_mark {
    return Intl.message(
      'تم حذف العلامة',
      name: 'remove_the_book_mark',
      desc: '',
      args: [],
    );
  }

  /// `تفسير`
  String get tafsser_ayah {
    return Intl.message(
      'تفسير',
      name: 'tafsser_ayah',
      desc: '',
      args: [],
    );
  }

  /// `تلاوة`
  String get listen_ayah {
    return Intl.message(
      'تلاوة',
      name: 'listen_ayah',
      desc: '',
      args: [],
    );
  }

  /// `نسخ`
  String get copy_ayah {
    return Intl.message(
      'نسخ',
      name: 'copy_ayah',
      desc: '',
      args: [],
    );
  }

  /// `مشاركة`
  String get share_ayah {
    return Intl.message(
      'مشاركة',
      name: 'share_ayah',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد تفسير`
  String get no_tafseer {
    return Intl.message(
      'لا يوجد تفسير',
      name: 'no_tafseer',
      desc: '',
      args: [],
    );
  }

  /// `الرجوع`
  String get back {
    return Intl.message(
      'الرجوع',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد اتصال`
  String get no_connection {
    return Intl.message(
      'لا يوجد اتصال',
      name: 'no_connection',
      desc: '',
      args: [],
    );
  }

  /// `دعاء الختم`
  String get quran_dua {
    return Intl.message(
      'دعاء الختم',
      name: 'quran_dua',
      desc: '',
      args: [],
    );
  }

  /// `البحث`
  String get search {
    return Intl.message(
      'البحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `أدخل اسم الآية التى تريد البحث عنها...`
  String get search_hint_enter {
    return Intl.message(
      'أدخل اسم الآية التى تريد البحث عنها...',
      name: 'search_hint_enter',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد نتائج`
  String get no_results {
    return Intl.message(
      'لا يوجد نتائج',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }

  /// `الآية`
  String get ayah_num {
    return Intl.message(
      'الآية',
      name: 'ayah_num',
      desc: '',
      args: [],
    );
  }

  /// `عدد الآيات`
  String get num_of_the_ayahs {
    return Intl.message(
      'عدد الآيات',
      name: 'num_of_the_ayahs',
      desc: '',
      args: [],
    );
  }

  /// ` من الشمال الحقيقي`
  String get from_real_nourth {
    return Intl.message(
      ' من الشمال الحقيقي',
      name: 'from_real_nourth',
      desc: '',
      args: [],
    );
  }

  /// `الشمال الحقيقي`
  String get real_nourth {
    return Intl.message(
      'الشمال الحقيقي',
      name: 'real_nourth',
      desc: '',
      args: [],
    );
  }

  /// `الكعبة`
  String get Kaaba {
    return Intl.message(
      'الكعبة',
      name: 'Kaaba',
      desc: '',
      args: [],
    );
  }

  /// `تم التنزيل بنجاح`
  String get success_download {
    return Intl.message(
      'تم التنزيل بنجاح',
      name: 'success_download',
      desc: '',
      args: [],
    );
  }

  /// `قريبًا`
  String get soon {
    return Intl.message(
      'قريبًا',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `يرجي الإنتظار لإكمال التنزيل`
  String get download_waiting {
    return Intl.message(
      'يرجي الإنتظار لإكمال التنزيل',
      name: 'download_waiting',
      desc: '',
      args: [],
    );
  }

  /// `آخر إستماع`
  String get last_listen {
    return Intl.message(
      'آخر إستماع',
      name: 'last_listen',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get profile {
    return Intl.message(
      'الملف الشخصي',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد تسجبل الخروج؟`
  String get logout_question {
    return Intl.message(
      'هل تريد تسجبل الخروج؟',
      name: 'logout_question',
      desc: '',
      args: [],
    );
  }

  /// `إلغاء`
  String get cancel {
    return Intl.message(
      'إلغاء',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `خروج`
  String get logout_ok {
    return Intl.message(
      'خروج',
      name: 'logout_ok',
      desc: '',
      args: [],
    );
  }

  /// `العمر`
  String get age {
    return Intl.message(
      'العمر',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `الجنس`
  String get gender {
    return Intl.message(
      'الجنس',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `حفظ`
  String get save {
    return Intl.message(
      'حفظ',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `يرجي ادخال عمر صالح`
  String get age_hint {
    return Intl.message(
      'يرجي ادخال عمر صالح',
      name: 'age_hint',
      desc: '',
      args: [],
    );
  }

  /// `تم حفظ التغييرات`
  String get success_update {
    return Intl.message(
      'تم حفظ التغييرات',
      name: 'success_update',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك قم بتسجيل الدخول,ثم حاول مرة أخري لتأكيد الحساب`
  String get re_auth_account {
    return Intl.message(
      'من فضلك قم بتسجيل الدخول,ثم حاول مرة أخري لتأكيد الحساب',
      name: 're_auth_account',
      desc: '',
      args: [],
    );
  }

  /// `حذف الحساب`
  String get delete_account {
    return Intl.message(
      'حذف الحساب',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد حذف الحساب ؟`
  String get delete_account_question {
    return Intl.message(
      'هل تريد حذف الحساب ؟',
      name: 'delete_account_question',
      desc: '',
      args: [],
    );
  }

  /// `حذف`
  String get delete {
    return Intl.message(
      'حذف',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجبل الخروج`
  String get success_logout {
    return Intl.message(
      'تم تسجبل الخروج',
      name: 'success_logout',
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
