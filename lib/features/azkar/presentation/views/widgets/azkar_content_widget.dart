import 'package:flutter/material.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/azkar_list_view_widget.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/zekr_of_the_day_container_widget.dart';

class AzkarContentWidget extends StatefulWidget {
  const AzkarContentWidget({super.key, required this.list});
  final List<Zekr> list;

  @override
  State<AzkarContentWidget> createState() => _AzkarContentWidgetState();
}

class _AzkarContentWidgetState extends State<AzkarContentWidget> {
  ScrollController scrollController = ScrollController();

  int length = 10;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_loadMoreData);
  }

  void _loadMoreData() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (widget.list.length > length) {
        length += 10;
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            if (mounted) {
              setState(() {});
            }
          },
        );
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const ZekrOfTheDayContainerWidget(),
            const SizedBox(
              height: 20,
            ),
            AzkarListViewWidget(
              list: widget.list,
              length: length,
            ),
          ],
        ),
      ),
    );
  }
}
