import 'package:flutter/cupertino.dart';
import 'package:muslim_app/core/widgets/add_text_field_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class NewtafseerContentWidget extends StatelessWidget {
  const NewtafseerContentWidget(
      {super.key,
      required this.personController,
      required this.tafseerController,
      required this.vedioController,
      required this.autovalidateMode,
      required this.formKey});
  final TextEditingController personController;
  final TextEditingController tafseerController;
  final TextEditingController vedioController;
  final AutovalidateMode autovalidateMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AddTextFieldWidget(
              controller: personController,
              autovalidateMode: autovalidateMode,
              lable: S.of(context).name_of_the_pserson,
            ),
            const SizedBox(
              height: 20,
            ),
            AddTextFieldWidget(
              controller: tafseerController,
              autovalidateMode: autovalidateMode,
              lable: S.of(context).tafseer_name,
            ),
            const SizedBox(
              height: 20,
            ),
            AddTextFieldWidget(
              controller: vedioController,
              autovalidateMode: autovalidateMode,
              lable: S.of(context).tafseer_vedio,
            ),
          ],
        ),
      ),
    );
  }
}
