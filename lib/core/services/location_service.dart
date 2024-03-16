import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';

class LocationService {
  static String currentLang = Intl.getCurrentLocale().split('_')[0];

  static Future<String> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (!isConnected) {
      return currentLang == 'en'
          ? 'Please check the internet connection'
          : 'من فضلك قم بالتحقق من الاتصال';
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return currentLang == 'en'
          ? 'Please enble location sevice'
          : 'من فضلك قم بتفعيل خدمة الموقع';
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return currentLang == 'en'
          ? 'Please enble location permission'
          : 'من فضلك قم بالسماح للوصول للموقع';
    }
    if (permission == LocationPermission.deniedForever) {
      return currentLang == 'en'
          ? 'Please enble location permission'
          : 'من فضلك قم بالسماح للوصول للموقع';
    }

    return '';
  }

  static Future<Position> getPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getAddress({required Position location}) async {
    var result = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );
    if (result.isNotEmpty) {
      String country = result.first.country ?? '';
      String subAdministrativeArea = result.first.subAdministrativeArea ?? '';
      return '$country $subAdministrativeArea';
    } else {
      return '';
    }
  }
}
