import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class ParentCategoryPage extends StatelessWidget {
  ParentCategoryPage({super.key});
  final List<String> categoryNames = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _categoryAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              _progressIndicator(),
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

  AppBar _categoryAppBar() {
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

  Container _progressIndicator() {
    return Container(
      height: 4,
      width: 37,
      color: AppColors.red,
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
