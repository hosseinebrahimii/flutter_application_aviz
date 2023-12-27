import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ItemChecker extends StatefulWidget {
  const ItemChecker({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<ItemChecker> createState() => _ItemCheckerState();
}

class _ItemCheckerState extends State<ItemChecker> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
            color: AppColors.borderColor,
          ),
        ),
        child: Row(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Spacer(),
            FlutterSwitch(
              value: _isOn,
              onToggle: (value) {
                setState(() {
                  _isOn = value;
                });
              },
              height: 16.25,
              width: 20,
              toggleSize: 9,
              activeColor: AppColors.red,
              inactiveColor: AppColors.lighterGrey,
              toggleColor: AppColors.backgroundColor,
              padding: 3,
              duration: const Duration(milliseconds: 100),
            ),
          ],
        ),
      ),
    );
  }
}
