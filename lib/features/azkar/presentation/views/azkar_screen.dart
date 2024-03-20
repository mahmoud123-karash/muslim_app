import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/azkar/presentation/views/favorite_screen.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/azkar_content_builder_widget.dart';

import 'package:muslim_app/generated/l10n.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
        S.of(context).azkar,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: IconButton(
              onPressed: () {
                navigateTo(context, const FavoriteScreen());
              },
              icon: Icon(
                Ionicons.heart,
                color: secondColor,
              ),
            ),
          ),
        ],
      ),
      body: const AzkarContentBuilderWidget(),
    );
  }
}
