import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'reciters_list_view_widget.dart';

class RecitersContentWidgetWidget extends StatefulWidget {
  const RecitersContentWidgetWidget({super.key, required this.reciters});
  final List<ReciterEntity> reciters;

  @override
  State<RecitersContentWidgetWidget> createState() =>
      _RecitersContentWidgetWidgetState();
}

class _RecitersContentWidgetWidgetState
    extends State<RecitersContentWidgetWidget> {
  TextEditingController controller = TextEditingController();

  List<ReciterEntity> searchList = [];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: searchField(
            hint: S.of(context).enter_reciter_name,
            controller: controller,
            onChanged: (value) {
              searchList = widget.reciters
                  .where((element) => element.reciterName.contains(value))
                  .toList();
              setState(() {});
            },
            context: context,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RecitersListViewWidget(
          list: controller.text == '' ? widget.reciters : searchList,
        ),
        if (searchList.isEmpty && controller.text != '')
          Expanded(
            child: MessageBuilderWidget(
              message: S.of(context).no_reciter_with_name,
            ),
          ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
