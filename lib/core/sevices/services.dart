import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

void openUri({required Uri url}) async {
  await launchUrl(url).then((value) {});
}

Future<void> share({
  required String title,
  required String text,
}) async {
  await FlutterShare.share(
    title: title,
    text: text,
    linkUrl: appLink,
  );
}

String formatTimeDifference(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 30) {
    final weeks = (difference.inDays / 7).floor();
    return '$weeks week${weeks > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 365) {
    final months = (difference.inDays / 30).floor();
    return '$months month${months > 1 ? 's' : ''} ago';
  } else {
    final years = (difference.inDays / 365).floor();
    return '$years year${years > 1 ? 's' : ''} ago';
  }
}

String formatTimeDifferenceInArabic(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'الآن';
  } else if (difference.inMinutes < 60) {
    return 'منذ ${difference.inMinutes} دقائق';
  } else if (difference.inHours < 24) {
    return 'منذ ${difference.inHours} ساعات';
  } else if (difference.inDays < 7) {
    return 'منذ ${difference.inDays} ${difference.inDays == 1 ? 'يوم' : 'أيام'}';
  } else if (difference.inDays < 30) {
    final weeks = (difference.inDays / 7).floor();
    return 'منذ $weeks ${weeks == 1 ? 'أسبوع' : 'أسابيع'}';
  } else if (difference.inDays < 365) {
    final months = (difference.inDays / 30).floor();
    return 'منذ $months ${months > 1 ? 'أ' : ''}شهر';
  } else {
    final years = (difference.inDays / 365).floor();
    return 'منذ $years ${years == 1 ? 'ًسنة' : 'سنوات'}';
  }
}

DateTime nextScheduledDate(hour, minute) {
  final DateTime now = DateTime.now();
  DateTime scheduledDate = DateTime(
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

String formatNumber(int number) {
  final formatter = NumberFormat.compact(
    locale: Intl.getCurrentLocale(),
  );
  return formatter.format(number);
}

String getArabicNumber(int number) {
  ArabicNumbers arabicNumber = ArabicNumbers();
  return arabicNumber.convert(number);
}
