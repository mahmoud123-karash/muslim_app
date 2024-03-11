import 'package:muslim_app/core/cache/shared_preference.dart';

void saveUid(value) => CacheHelper.saveData(
      key: 'uid',
      value: value,
    );

void saveTheme(value) => CacheHelper.saveData(
      key: 'isdark',
      value: value,
    );

void saveLanguage(value) => CacheHelper.saveData(
      key: 'lang',
      value: value,
    );

void saveLat(value) => CacheHelper.saveData(
      key: 'lat',
      value: value,
    );

void saveLong(value) => CacheHelper.saveData(
      key: 'long',
      value: value,
    );

void saveAddress(value) => CacheHelper.saveData(
      key: 'address',
      value: value,
    );

void saveSRandom(value) => CacheHelper.saveData(
      key: 'sRandom',
      value: value,
    );
void saveVRandom(value) => CacheHelper.saveData(
      key: 'vRandom',
      value: value,
    );

void saveNotificationStatus(value) => CacheHelper.saveData(
      key: 'isnotify',
      value: value,
    );

void saveIsSkip(value) => CacheHelper.saveData(
      key: 'isSkip',
      value: value,
    );

void saveEmail(value) => CacheHelper.saveData(
      key: 'email',
      value: value,
    );

void saveGender(value) => CacheHelper.saveData(
      key: 'gender',
      value: value,
    );
