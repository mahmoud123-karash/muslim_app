import 'package:cached_network_image/cached_network_image.dart';
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
          image: image == ''
              ? const AssetImage(
                  Assets.imagesProfile,
                )
              : CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ) as ImageProvider,
        ),
      ),
    );
  }
}
