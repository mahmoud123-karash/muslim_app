import 'package:muslim_app/core/cache/shared_preference.dart';

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
