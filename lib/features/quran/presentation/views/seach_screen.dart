import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/sevices/normilze_text_service.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/quran/data/models/surah_model.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/search_text_field_widget.dart';
import 'package:muslim_app/features/quran/presentation/views/widgets/serach_list_view_widget.dart';
import 'package:muslim_app/generated/l10n.dart';

import 'widgets/search_ayah_num_container_widget.dart';

class SerachScreen extends StatefulWidget {
  const SerachScreen({super.key, required this.list});
  final List<Ayah> list;

  @override
  State<SerachScreen> createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
  TextEditingController searchController = TextEditingController();

  List<Ayah> searchList = [];
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).search),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Column(
          children: [
            SearchTextFieldWidget(
              onChanged: (value) {
                if (searchController.text == '') {
                  searchList.clear();
                  setState(() {});
                }
              },
              onFieldSubmitted: (value) {
                searchList = widget.list
                    .where(
                      (element) => normalise(element.text).contains(
                        searchController.text,
                      ),
                    )
                    .toList();
                setState(() {});
              },
              searchController: searchController,
            ),
            if (searchList.isNotEmpty)
              const SizedBox(
                height: 15,
              ),
            if (searchList.isNotEmpty)
              SearchAyahNumContainerWidget(num: searchList.length),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: searchController.text == ''
                  ? Icon(
                      Ionicons.search_outline,
                      size: 30,
                      color: greyColor,
                    )
                  : searchController.text != '' && searchList.isEmpty
                      ? MessageBuilderWidget(
                          message: S.of(context).no_results,
                        )
                      : SearchListViewWidget(
                          list: searchList,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
