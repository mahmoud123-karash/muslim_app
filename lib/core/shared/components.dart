import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/utils/navigation_route.dart';
import 'package:muslim_app/generated/l10n.dart';

GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> get navigationKey => _navigationKey;

void navigateTo(context, route) => Navigator.push(
      context,
      createRoute(route),
    );

void navigateToAndReplace(context, route) => Navigator.pushReplacement(
      context,
      createRoute(route),
    );

void navigateToAndFinish(context, route) => Navigator.pushAndRemoveUntil(
      context,
      createRoute(route),
      (route) => false,
    );

void showToast(
  String message, {
  ToastGravity? gravity = ToastGravity.BOTTOM,
}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: appColor,
    gravity: gravity,
    textColor: whiteColor,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showSnackBar(context, message) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        content: Text(message),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

AppBar appAppBar(
  title, {
  List<Widget>? actions,
  bool centerTitle = true,
}) =>
    AppBar(
      centerTitle: centerTitle,
      title: Text(
        title,
      ),
      actions: actions,
    );

Widget searchField({
  required TextEditingController controller,
  required Function(String) onChanged,
  required BuildContext context,
  String? hint,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Ionicons.search_outline,
          ),
          hintText: hint ?? S.of(context).search,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
