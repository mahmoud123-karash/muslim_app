import 'package:flutter/material.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/ayah_details_options_container_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class TafseerDetailsRowWidget extends StatelessWidget {
  const TafseerDetailsRowWidget(
      {super.key, required this.text, required this.ayaTap});
  final String text;
  final VoidCallback ayaTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          AyahDetailsOptionsContainerWidget(
            lable: S.of(context).back,
            icon: Icons.backspace_outlined,
            onPressed: ayaTap,
          ),
          const SizedBox(
            width: 5,
          ),
          AyahDetailsOptionsContainerWidget(
            lable: S.of(context).copy_ayah,
            icon: Icons.copy,
            onPressed: () {
              copyToClipboard(context, text);
            },
          ),
          const SizedBox(
            width: 5,
          ),
          AyahDetailsOptionsContainerWidget(
            lable: S.of(context).share_ayah,
            icon: Icons.share,
            onPressed: () {
              share(title: S.of(context).tafsser_ayah, text: text);
            },
          ),
        ],
      ),
    );
  }
}
