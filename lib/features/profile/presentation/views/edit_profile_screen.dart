import 'package:flutter/material.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/generated/l10n.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
        centerTitle: true,
      ),
    );
  }
}
