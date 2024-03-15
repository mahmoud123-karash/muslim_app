import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/styles/text_styles.dart';
import 'package:muslim_app/generated/l10n.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget(
      {super.key,
      required this.onFieldSubmitted,
      required this.searchController,
      required this.onChanged});
  final Function(String) onFieldSubmitted;
  final TextEditingController searchController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: greyColor.withOpacity(0.3),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: searchController,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: S.of(context).search_hint_enter,
          hintStyle: TextStyles.style13.copyWith(
            fontWeight: FontWeight.bold,
            color: greyColor,
          ),
          prefixIcon: const Icon(
            Ionicons.search_outline,
          ),
        ),
      ),
    );
  }
}
