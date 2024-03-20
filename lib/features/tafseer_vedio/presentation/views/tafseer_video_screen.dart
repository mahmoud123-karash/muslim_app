import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/tafseer_list_view_builder_widget.dart';

class TafseerVideoScreen extends StatelessWidget {
  const TafseerVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(S.of(context).tafsser_video),
      body: const TafseerContentBuilderWidget(),
    );
  }
}
