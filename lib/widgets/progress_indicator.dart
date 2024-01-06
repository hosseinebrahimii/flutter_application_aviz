import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    required this.percentage,
  });
  final int percentage;
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 4,
          width: MediaQuery.of(context).size.width * percentage / 100,
          color: AppColors.red,
        ),
      ],
    );
  }
}
