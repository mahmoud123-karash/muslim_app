import 'package:flutter/material.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/auth/data/models/user_model/user_model.dart';
import 'package:muslim_app/features/profile/presentation/manager/image_cubit/image_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

import '../manager/profile_cubit/profile_cubit.dart';
import 'widgets/edit_profile_content_widget.dart';
import 'widgets/edit_profile_custom_builder_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    ImageCubit.get(context).clearImage();
    CacheHelper.removeData(key: 'gender');
    nameController.text = widget.user.name;
    phoneController.text = widget.user.phone;
    ageController.text = widget.user.age.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(
        S.of(context).profile,
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) => const RemoveDialogtDialogWidget(),
          //     );
          //   },
          //   icon: const Icon(Ionicons.person_remove_outline),
          // )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: EditProfileContentWidget(
              formKey: formKey,
              nameController: nameController,
              phoneController: phoneController,
              ageController: ageController,
              autovalidateMode: autovalidateMode,
              image: widget.user.image,
              gender: widget.user.gender,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: EditProfileCustomBuilderWidget(
                  onPressed: () {
                    String gender = CacheHelper.getData(key: 'gender') ??
                        widget.user.gender;

                    List<String> paths = ImageCubit.get(context).paths;
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (ageController.text == '0') {
                        showSnackBar(context, S.of(context).age_hint);
                      } else {
                        ProfileCubit.get(context).updateProfile(
                          name: nameController.text,
                          uid: widget.user.uid,
                          email: widget.user.email,
                          age: int.parse(ageController.text),
                          gender: gender,
                          image: paths.isEmpty ? '' : paths.first,
                          phone: phoneController.text,
                        );
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
