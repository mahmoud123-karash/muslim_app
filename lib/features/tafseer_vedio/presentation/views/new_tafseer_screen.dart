import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/utils/regex.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/prayer_cubit/video_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/add_tafseer_custom_button_widget.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                  child: AddTafseerCustomButtonWidget(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (RegExp(RegexPatterns.allowedYoutubeUrlFormat)
                                .hasMatch(vedioController.text) ==
                            false) {
                          showSnackBar(
                              context, S.of(context).video_hint_message);
                        } else {
                          VideoCubit.get(context).addNewTafseer(
                            personName: personController.text,
                            tafseerTitle: tafseerController.text,
                            vedioUri: vedioController.text,
                          );
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
