import 'package:flutter/material.dart';
import 'package:muslim_app/core/widgets/add_text_field_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

class SendNotificationContentWidget extends StatelessWidget {
  const SendNotificationContentWidget(
      {super.key,
      required this.titleContoller,
      required this.textContoller,
      required this.autovalidateMode,
      required this.formKey});
  final TextEditingController titleContoller;
  final TextEditingController textContoller;
  final AutovalidateMode autovalidateMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AddTextFieldWidget(
              controller: titleContoller,
              autovalidateMode: autovalidateMode,
              lable: S.of(context).notification_title,
            ),
            const SizedBox(
              height: 25,
            ),
            AddTextFieldWidget(
              controller: textContoller,
              autovalidateMode: autovalidateMode,
              lable: S.of(context).notification_text,
            ),
          ],
        ),
      ),
    );
  }
}
