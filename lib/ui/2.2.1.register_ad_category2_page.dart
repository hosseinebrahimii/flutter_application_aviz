import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/widgets/progress_indicator.dart';

class RegisterAdCategory2Page extends StatelessWidget {
  RegisterAdCategory2Page({super.key});
  final List<String> categoryNames = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _registerAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              const ProgressIndicatorWidget(percentage: 20),
              const SizedBox(
                height: 32,
              ),
              ...List.generate(
                categoryNames.length,
                (index) {
                  return Column(
                    children: [
                      _categoryItem(context, categoryNames[index]),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _registerAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 42,
      backgroundColor: AppColors.backgroundColor,
      title: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/arrowRight.png'),
          Image.asset(
            'assets/images/avizCategory.png',
            height: 42,
          ),
          Image.asset('assets/images/closeSquare.png')
        ],
      ),
    );
  }

  Widget _categoryItem(BuildContext context, String name) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 16),
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
              name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Spacer(),
            Image.asset('assets/images/arrowLeft.png'),
          ],
        ),
      ),
    );
  }
}
