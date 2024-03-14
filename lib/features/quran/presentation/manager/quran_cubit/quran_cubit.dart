import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/sevices/json_service.dart';
import 'package:muslim_app/features/quran/data/models/surahs_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/quran_cubit/quran_states.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(InitialQuranState());
  static QuranCubit get(context) => BlocProvider.of(context);

  List<Surah> surahs = [];
  List<List<Ayah>> pages = [];
  List<Ayah> allAyahs = [];

  Future<void> loadQuran() async {
    String jsonString = await rootBundle.loadString(JsonService.quran);
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
    List<dynamic> surahsJson = jsonResponse['data']['surahs'];
    surahs = surahsJson.map((s) => Surah.fromJson(s)).toList();
    for (final surah in surahs) {
      allAyahs.addAll(surah.ayahs);
    }
    List.generate(
      604,
      (pageIndex) {
        pages.add(
          allAyahs.where((ayah) => ayah.page == pageIndex + 1).toList(),
        );
      },
    );
    emit(SuccessLoadQuranState());
  }

  List<Ayah> getCurrentPageAyahs(int pageIndex) => pages[pageIndex];

  String getSurahNameFromPage(int pageNumber) {
    try {
      return surahs
          .firstWhere(
              (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
          .arabicName;
    } catch (e) {
      return "Surah not found";
    }
  }

  int getSurahNumberFromPage(int pageNumber) => surahs
      .firstWhere(
          (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
      .surahNumber;

  List<List<Ayah>> getCurrentPageAyahsSeparatedForBasmalah(int pageIndex) =>
      pages[pageIndex]
          .splitBetween((f, s) => f.ayahNumber > s.ayahNumber)
          .toList();

  int getSurahNumberByAyah(Ayah ayah) =>
      surahs.firstWhere((s) => s.ayahs.contains(ayah)).surahNumber;

  Surah getSurahDataByAyahUQ(int ayah) =>
      surahs.firstWhere((s) => s.ayahs.any((a) => a.ayahUQNumber == ayah));

  Ayah getJuzByPage(int page) => allAyahs.firstWhere((a) => a.page == page + 1);

  String getSurahByAyahUQ(int ayah) => surahs
      .firstWhere((s) => s.ayahs.any((a) => a.ayahUQNumber == ayah))
      .arabicName;

  final GlobalKey<ScaffoldState> quranKey = GlobalKey<ScaffoldState>();
  void closeDrawer() {
    if (quranKey.currentState!.isDrawerOpen) {
      quranKey.currentState!.closeDrawer();
    }
  }

  void openDrawer() {
    if (!quranKey.currentState!.isDrawerOpen) {
      quranKey.currentState!.openDrawer();
    }
  }

  void saveMarkPage(page) {
    saveMark(page);
    emit(SaveMarkPageState());
  }

  void removeMarkPage() {
    CacheHelper.removeData(key: 'saveMark');
    emit(SaveMarkPageState());
  }
}
