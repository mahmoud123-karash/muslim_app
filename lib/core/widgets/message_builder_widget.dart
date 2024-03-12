import 'package:flutter/material.dart';
import 'package:muslim_app/core/styles/text_styles.dart';

class MessageBuilderWidget extends StatelessWidget {
  const MessageBuilderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          message,
          style: TextStyles.style15,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
