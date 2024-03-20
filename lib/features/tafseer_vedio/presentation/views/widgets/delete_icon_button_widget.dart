import 'package:flutter/material.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/widgets/delete_dialog_widget.dart';

class DeleteIconButtonWidget extends StatelessWidget {
  const DeleteIconButtonWidget(
      {super.key, required this.uid, required this.tafseerTitle});
  final String uid, tafseerTitle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => DeleteDialogWidget(
            uid: uid,
            tafseerTitle: tafseerTitle,
          ),
        );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}
