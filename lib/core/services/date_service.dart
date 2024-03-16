import 'package:jhijri/jHijri.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/services/services.dart';

class DateSevice {
  static DateTime now = DateTime.now();
  static String dateFormatted = DateFormat.yMMMEd().format(now);

  static JHijri jHijri = JHijri.now();

  static var dayname = jHijri.dayName;
  static var day = jHijri.day;
  static var monthName = jHijri.monthName;
  static var year = jHijri.year;
  static String arJHijriDate =
      '$dayname ${getArabicNumber(day)} $monthName ${getArabicNumber(year)}';
}
