// import 'package:muslim_app/features/quran/data/models/surahs_model.dart';

// class QuranService {
//   List<Ayah> getCurrentPageAyahs(int pageIndex) => pages[pageIndex];

//   int getSurahNumberFromPage(int pageNumber) => surahs
//       .firstWhere(
//           (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
//       .surahNumber;

//   Surah getCurrentSurahByPage(int pageNumber) => surahs.firstWhere(
//       (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first));

//   String getSurahNameFromPage(int pageNumber) {
//     try {
//       return surahs
//           .firstWhere(
//               (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
//           .arabicName;
//     } catch (e) {
//       return "Surah not found";
//     }
//   }

//   int getSurahNumberByAyah(Ayah ayah) =>
//       surahs.firstWhere((s) => s.ayahs.contains(ayah)).surahNumber;

//   Surah getSurahDataByAyahUQ(int ayah) =>
//       surahs.firstWhere((s) => s.ayahs.any((a) => a.ayahUQNumber == ayah));

//   Ayah getJuzByPage(int page) => allAyahs.firstWhere((a) => a.page == page + 1);

//   String getSurahByAyahUQ(int ayah) => surahs
//       .firstWhere((s) => s.ayahs.any((a) => a.ayahUQNumber == ayah))
//       .arabicName;

//   bool getSajdaInfoForPage(List<Ayah> pageAyahs) {
//     for (var ayah in pageAyahs) {
//       if (ayah.sajda != false && ayah.sajda is Map) {
//         var sajdaDetails = ayah.sajda;
//         if (sajdaDetails['recommended'] == true ||
//             sajdaDetails['obligatory'] == true) {
//           return isSajda.value = true;
//         }
//       }
//     }
//     // No sajda found on this page
//     return isSajda.value = false;
//   }

//   List<Ayah> get currentPageAyahs =>
//       pages[generalCtrl.currentPageNumber.value - 1];

//   double getSajdaPosition(int pageIndex) {
//     final sajdaAyah = _getAyahWithSajdaInPage(pageIndex);
//     isSajda.value = sajdaAyah != null ? true : false;
//     final lines = pages[pageIndex]
//         .map((a) {
//           if (a.text.contains('۩')) {
//             return '${a.code_v2}۩';
//           }
//           return a.code_v2;
//         })
//         .join()
//         .split('\n');
//     // final lines =newLineRegex
//     //     .allMatches(currentPageAyahs.map((a) {
//     //   if(a.text.contains('۩')){
//     //     return '${a.code_v2}۩';
//     //   }
//     //   return a.code_v2;
//     // }).join()).toList();
//     double position =
//         (lines.indexWhere((line) => line.contains('۩')) + 1).toDouble();
//     log("Sajda Position is: $position");

//     return position;
//   }
// }
