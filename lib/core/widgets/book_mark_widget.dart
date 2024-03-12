// import 'package:flutter/material.dart';

// Widget bookmarkIcon({double? height, double? width, int? pageNum}) {
//   return Obx(() {
//     return Semantics(
//       button: true,
//       enabled: true,
//       label: 'Add Bookmark',
//       child: SvgPicture.asset(
//         sl<BookmarksController>().isPageBookmarked(
//                 pageNum ?? sl<GeneralController>().currentPageNumber.value)
//             ? 'assets/svg/bookmarked.svg'
//             : Get.context!.bookmarkPageIcon(),
//         width: width,
//         height: height,
//       ),
//     );
//   });
// }