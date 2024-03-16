import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CircleAvatar(
      radius: width / 3.5,
      backgroundImage: AssetImage(
        image,
      ),
    );
  }
}
