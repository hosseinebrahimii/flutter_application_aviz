import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

// this widget show the image with the url given
// also this widget handles:
// Errors when the url is wrong,
// loading time (when the url is right but it needs time to download and show the image)

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.imageUrl = '',
    this.borderRaduis = 2,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double borderRaduis;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRaduis),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        errorWidget: (context, url, error) {
          return Container(
            color: AppColors.lighterGrey,
            child: Icon(
              Icons.no_photography_outlined,
              color: AppColors.lightGrey,
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            color: AppColors.lighterGrey,
            alignment: Alignment.center,
            child: Icon(
              Icons.cloud_download_outlined,
              color: AppColors.lightGrey,
            ),
          );
        },
      ),
    );
  }
}
