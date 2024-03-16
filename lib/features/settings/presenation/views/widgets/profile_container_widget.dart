import 'package:flutter/material.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:muslim_app/features/settings/presenation/views/widgets/user_image_container_widget.dart';

import 'name_and_email_colum_widget.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: secondColor.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserImageConatinerWidget(image: user.image),
              const SizedBox(
                width: 10,
              ),
              NameAndEmailColumWidget(name: user.name, email: user.email),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  navigateTo(context, EditProfileScreen(user: user));
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appColor.withOpacity(0.2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.mode_edit_outline_outlined),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
