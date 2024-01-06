import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/util/int_extension.dart';
import 'package:flutter_application_aviz/widgets/cached_image.dart';

class VerticalAdCard extends StatelessWidget {
  const VerticalAdCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.body,
    required this.price,
  });
  final void Function() onTap;
  final String imageUrl;
  final String title;
  final String body;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _adBox(context),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  Container _adBox(BuildContext context) {
    return Container(
      width: 224,
      height: 267,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.backgroundColor,
        boxShadow: _boxShadows(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _adPicture(),
          const SizedBox(
            height: 16,
          ),
          _adDetails(context),
          const SizedBox(
            height: 16,
          ),
          _adPrice(context),
        ],
      ),
    );
  }

  List<BoxShadow> _boxShadows() {
    return [
      BoxShadow(
        color: AppColors.boxShadowColor.withOpacity(0.02),
        blurRadius: 10,
        offset: const Offset(0, 4),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: AppColors.boxShadowColor.withOpacity(0.02),
        blurRadius: 18,
        offset: const Offset(0, 18),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: AppColors.boxShadowColor.withOpacity(0.01),
        blurRadius: 24,
        offset: const Offset(0, 40),
        spreadRadius: 0,
      ),
    ];
  }

  SizedBox _adPicture() {
    return SizedBox(
      width: 192,
      height: 112,
      child: CachedImage(
        imageUrl: imageUrl,
      ),
    );
  }

  Column _adDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          body,
          maxLines: 2,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }

  Row _adPrice(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'قیمت:',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.textBackgroundColor,
          ),
          child: Text(
            price.changeToPrice(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
