import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/core/widgets/add_custom_buttom_widget.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/presentation/views/new_tafseer_screen.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'tafseer_list_view_widget.dart';

class TafseerContentWidget extends StatefulWidget {
  const TafseerContentWidget({super.key, required this.list});
  final List<TafseerVideoModel> list;

  @override
  State<TafseerContentWidget> createState() => _TafseerContentWidgetState();
}

class _TafseerContentWidgetState extends State<TafseerContentWidget> {
  final TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<TafseerVideoModel> searchList = [];

  int length = 10;

  @override
  void initState() {
    scrollController.addListener(_loadMoreData);
    super.initState();
  }

  void _loadMoreData() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (widget.list.length > length) {
        length += 10;
        Future.delayed(const Duration(seconds: 1)).then((value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() {});
          });
        });
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchField(
          controller: searchController,
          onChanged: (value) {
            searchList = widget.list
                .where(
                  (element) => element.tafseerTitle.contains(value),
                )
                .toList();
            setState(() {});
          },
          context: context,
        ),
        AddCustomButtonWidget(
          lable: S.of(context).add_new_tsfseer,
          onPressed: () {
            navigateTo(context, const NewTafseerScreen());
          },
        ),
        Expanded(
          child: widget.list.isEmpty
              ? MessageBuilderWidget(message: S.of(context).no_results)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TafseerListViewWidegt(
                    isDetails: false,
                    list:
                        searchController.text == '' ? widget.list : searchList,
                    length: length,
                  ),
                ),
        ),
        if (searchController.text != '' && searchList.isEmpty)
          Expanded(
            child: MessageBuilderWidget(message: S.of(context).no_results),
          )
      ],
    );
  }
}
