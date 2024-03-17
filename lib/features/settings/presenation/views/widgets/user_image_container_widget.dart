import 'package:flutter/material.dart';
import 'package:muslim_app/core/shared/assets.dart';

class UserImageConatinerWidget extends StatelessWidget {
  const UserImageConatinerWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: image == ''
              ? const AssetImage(
                  Assets.imagesProfile,
                ) as ImageProvider
              : NetworkImage(image),
        ),
      ),
    );
  }
}
