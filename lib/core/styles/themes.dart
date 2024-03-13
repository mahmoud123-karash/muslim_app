import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/core/contants/constants.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: appColor,
  primarySwatch: mainColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: appColor,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: whiteColor,
      systemNavigationBarColor: whiteColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: whiteColor,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: blackColor,
    ),
    titleTextStyle: TextStyles.style20Bold.copyWith(
      color: blackColor,
      fontFamily: 'cairo',
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyles.style14.copyWith(
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo',
    ),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: secondColor,
    backgroundColor: appColor,
    showSelectedLabels: true,
    unselectedItemColor: whiteColor,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: "cairo",
      color: Colors.black,
      fontSize: 16.0,
    ),
    bodyMedium: TextStyle(
      fontFamily: "cairo",
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      fontFamily: "cairo",
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),
    bodySmall: TextStyle(
      fontFamily: "cairo",
      color: Colors.black54,
    ),
  ),
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    titleTextStyle: TextStyles.style13.copyWith(
      color: appColor,
      fontWeight: FontWeight.bold,
      fontFamily: "cairo",
    ),
    tileColor: appColor.withOpacity(0.2),
    iconColor: appColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.black,
    labelStyle: TextStyles.style14.copyWith(
      fontFamily: "cairo",
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    hintStyle: TextStyles.style14.copyWith(
      fontFamily: "cairo",
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: appColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: appColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: appColor),
    ),
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.light,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appColor,
    foregroundColor: Colors.white,
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyles.style16Bold.copyWith(
      color: blackColor,
      fontFamily: "cairo",
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: whiteColor,
  ),
  fontFamily: 'cairo',
  dividerColor: blackColor,
  cardColor: Colors.white,
  secondaryHeaderColor: Colors.white,
  indicatorColor: Colors.black,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.grey.shade900),
  dialogBackgroundColor: Colors.white,
  disabledColor: Colors.grey.shade300,
);

ThemeData darkTheme = ThemeData(
  drawerTheme: DrawerThemeData(
    backgroundColor: appColor,
  ),
  primaryColor: appColor,
  primarySwatch: mainColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: appColor,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: appColor.withOpacity(0.0),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: blackColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
    backgroundColor: appColor.withOpacity(0.0),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyles.style20Bold.copyWith(
      color: Colors.white,
      fontFamily: "cairo",
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: TextStyles.style14.copyWith(
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo',
    ),
    type: BottomNavigationBarType.fixed,
    selectedItemColor: secondColor,
    backgroundColor: appColor,
    showSelectedLabels: true,
    unselectedItemColor: whiteColor,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontFamily: "cairo",
      color: Colors.white,
      fontSize: 16.0,
    ),
    bodySmall: TextStyle(
      fontFamily: "cairo",
      color: Colors.white60,
    ),
    bodyLarge: TextStyle(
      fontFamily: "cairo",
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: "cairo",
      color: Colors.white,
    ),
  ),
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    titleTextStyle: TextStyles.style13.copyWith(
      color: whiteColor,
      fontWeight: FontWeight.bold,
      fontFamily: "cairo",
    ),
    tileColor: appColor.withOpacity(0.5),
    iconColor: whiteColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.white,
    labelStyle: const TextStyle(
      fontFamily: "cairo",
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    hintStyle: const TextStyle(
      fontFamily: "cairo",
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: appColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: appColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: appColor),
    ),
  ),
  dividerColor: whiteColor,
  dialogTheme: DialogTheme(
    backgroundColor: Colors.grey[700],
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: const TextStyle(
      fontFamily: "cairo",
      color: Colors.white,
      fontSize: 16,
    ),
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.dark,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    shape: CircularNotchedRectangle(),
    elevation: 3.0,
  ),
  fontFamily: 'cairo',
  iconTheme: const IconThemeData(color: Colors.white),
  indicatorColor: Colors.white,
  scaffoldBackgroundColor: appColor.withOpacity(0.1),
  cardColor: appColor,
  secondaryHeaderColor: appColor,
  canvasColor: appColor,
  disabledColor: appColor,
  dialogBackgroundColor: Colors.black87,
);
