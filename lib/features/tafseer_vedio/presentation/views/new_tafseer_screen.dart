import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/utils/regex.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/manager/video_cubit/video_cubit.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/add_tafseer_custom_button_widget.dart';
import 'widgets/new_tafseer_content_widget.dart';

class NewTafseerScreen extends StatefulWidget {
  const NewTafseerScreen({super.key, this.model});
  final TafseerVideoModel? model;

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
  void initState() {
    if (widget.model != null) {
      personController.text = widget.model!.personName;
      tafseerController.text = widget.model!.tafseerTitle;
      vedioController.text = widget.model!.vedioUri;
    }
    super.initState();
  }

  @override
  void dispose() {
    personController.dispose();
    tafseerController.dispose();
    vedioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(S.of(context).add_new_tsfseer),
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
                    lable: widget.model == null
                        ? S.of(context).add
                        : S.of(context).edit,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (RegExp(RegexPatterns.allowedYoutubeUrlFormat)
                                .hasMatch(vedioController.text) ==
                            false) {
                          showSnackBar(
                              context, S.of(context).video_hint_message);
                        } else {
                          if (widget.model != null) {
                            VideoCubit.get(context).editTafseer(
                              uid: widget.model!.uid!,
                              personName: personController.text,
                              tafseerTitle: tafseerController.text,
                              vedioUri: vedioController.text,
                            );
                          } else {
                            VideoCubit.get(context).addNewTafseer(
                              personName: personController.text,
                              tafseerTitle: tafseerController.text,
                              vedioUri: vedioController.text,
                            );
                          }
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
