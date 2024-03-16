import 'package:flutter/material.dart';
import 'package:muslim_app/generated/l10n.dart';

class TafseerVideoScreen extends StatelessWidget {
  const TafseerVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).tafsser_video),
      centerTitle: true,
    );
  }
}
