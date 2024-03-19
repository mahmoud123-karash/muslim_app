import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/add_custom_buttom_widget.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/new_tafseer_screen.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/tafseer_item_widget.dart';

class TafseerVideoScreen extends StatelessWidget {
  const TafseerVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tafsser_video),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AddCustomButtonWidget(
            lable: S.of(context).add_new_tsfseer,
            onPressed: () {
              navigateTo(context, const NewTafseerScreen());
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) => const TafseerItemWidget(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
