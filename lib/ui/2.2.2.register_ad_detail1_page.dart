import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/widgets/category_selection.dart';
import 'package:flutter_application_aviz/widgets/item_checker.dart';
import 'package:flutter_application_aviz/widgets/progress_indicator.dart';
import 'package:flutter_application_aviz/widgets/property_textfield.dart';

class RegisterAdDetail1Page extends StatelessWidget {
  const RegisterAdDetail1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _registerAppBar(),
      body: _body(context),
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
            'assets/images/registerAviz.png',
            height: 42,
          ),
          Image.asset('assets/images/closeSquare.png')
        ],
      ),
      bottom: const PreferredSize(
        preferredSize: Size(double.infinity, 4),
        child: ProgressIndicatorWidget(percentage: 40),
      ),
    );
  }

  SafeArea _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                _categorySectionHeader(context),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categorySection(context),
                    _addressSection(context),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Divider(
                  height: 0,
                  color: AppColors.textBackgroundColor,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 32,
                ),
                _propertiesSectionHeader(context),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _areaSection(context),
                    _roomSection(context),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _floorSection(context),
                    _yearSection(context),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Divider(
                  color: AppColors.textBackgroundColor,
                  height: 0,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 32,
                ),
                _facilitiesSectionHeader(context),
                const SizedBox(
                  height: 24,
                ),
                _facilitiesItems(),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('بعدی'),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categorySectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/categoryIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'انتخاب دسته‌بندی آویز',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Column _categorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'دسته‌بندی',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const CategorySelection(),
      ],
    );
  }

  Column _addressSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'محدوده ملک',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 159,
          height: 48,
          child: TextField(
            keyboardType: TextInputType.streetAddress,
            style: Theme.of(context).textTheme.headlineLarge,
            decoration: const InputDecoration(
              hintText: 'خیابان صیاد شیرازی',
            ),
          ),
        ),
      ],
    );
  }

  Row _propertiesSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/propertiesIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'ویژگی‌ها',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Column _areaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'متراژ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '300',
        ),
      ],
    );
  }

  Column _roomSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تعداد اتاق',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '6',
        ),
      ],
    );
  }

  Column _floorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طبقه',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '3',
        ),
      ],
    );
  }

  Column _yearSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'سال ساخت',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '1402',
        ),
      ],
    );
  }

  Widget _facilitiesSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/facilitiesIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'امکانات',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Column _facilitiesItems() {
    return const Column(
      children: [
        ItemChecker(
          title: 'آسانسور',
        ),
        SizedBox(
          height: 27,
        ),
        ItemChecker(
          title: 'پارکینگ',
        ),
        SizedBox(
          height: 27,
        ),
        ItemChecker(
          title: 'انباری',
        ),
      ],
    );
  }
}
