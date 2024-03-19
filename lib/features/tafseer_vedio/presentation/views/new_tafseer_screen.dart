import 'package:flutter/material.dart';
import 'package:muslim_app/core/widgets/custom_button_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/new_tafseer_content_widget.dart';

class NewTafseerScreen extends StatefulWidget {
  const NewTafseerScreen({super.key});

  @override
  State<NewTafseerScreen> createState() => _NewTafseerScreenState();
}

class _NewTafseerScreenState extends State<NewTafseerScreen> {
  TextEditingController personController = TextEditingController();
  TextEditingController tafseerController = TextEditingController();
  TextEditingController vedioController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).add_new_tsfseer),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: NewtafseerContentWidget(
                personController: personController,
                tafseerController: tafseerController,
                vedioController: vedioController,
                autovalidateMode: autovalidateMode,
                formKey: formKey,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButtonWidget(
                  lable: S.of(context).add,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
