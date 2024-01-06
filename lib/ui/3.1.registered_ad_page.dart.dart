import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/util/int_extension.dart';
import 'package:flutter_application_aviz/widgets/cached_image.dart';

class RegisteredAdPage extends StatelessWidget {
  const RegisteredAdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 42,
      backgroundColor: AppColors.backgroundColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/arrowRight.png',
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/informationIcon.png',
            ),
            const SizedBox(
              width: 24,
            ),
            Image.asset(
              'assets/images/shareIcon.png',
            ),
            const SizedBox(
              width: 24,
            ),
            Image.asset(
              'assets/images/archiveIcon.png',
            ),
          ],
        ),
      ),
    );
  }

  SafeArea _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _adInfo(context),
              _buttons(),
            ],
          ),
        ),
      ),
    );
  }

  DefaultTabController _adInfo(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 32,
                  width: double.infinity,
                ),
                //
                // ad image:
                const SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: CachedImage(),
                ),
                //
                const SizedBox(
                  height: 32,
                ),
                //
                // ad category:
                Row(
                  children: [
                    Container(
                      height: 29,
                      width: 59,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.textBackgroundColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'آپارتمان',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.red,
                            ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '16 دقیقه پیش در گرگان',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                  ],
                ),
                //
                const SizedBox(
                  height: 28,
                ),
                //
                // add title:
                Text(
                  'آپارتمان ۵۰۰ متری در صیاد شیرازی',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //
                const SizedBox(
                  height: 32,
                ),
                DottedLine(
                  dashColor: AppColors.textBackgroundColor,
                ),
                const SizedBox(
                  height: 32,
                ),
                _warningContainer(context),
                const SizedBox(
                  height: 32,
                ),
                _tabBar(context),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: _tabBarView(context),
          ),
        ],
      ),
    );
  }

  Positioned _buttons() {
    return Positioned(
      bottom: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 159,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/messageIcon.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text('گفتگو'),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          SizedBox(
            height: 40,
            width: 159,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/callIcon.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text('اطلاعات تماس'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _warningContainer(BuildContext context) {
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
              'هشدارهای قبل از معامله!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Spacer(),
            Image.asset(
              'assets/images/arrowLeft.png',
              color: AppColors.lighterGrey,
            ),
          ],
        ),
      ),
    );
  }

  TabBar _tabBar(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      labelColor: AppColors.backgroundColor,
      labelStyle: Theme.of(context).textTheme.bodySmall,
      unselectedLabelColor: AppColors.red,
      unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      indicatorPadding: const EdgeInsets.only(bottom: 3),
      tabs: [
        Container(
          alignment: Alignment.center,
          height: 29,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: AppColors.textBackgroundColor,
            ),
          ),
          child: const Text('مشخصات'),
        ),
        Container(
          alignment: Alignment.center,
          height: 29,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: AppColors.textBackgroundColor,
            ),
          ),
          child: const Text('قیمت'),
        ),
        Container(
          alignment: Alignment.center,
          height: 29,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: AppColors.textBackgroundColor,
            ),
          ),
          child: const Text('ویژگی‌ها و امکانات'),
        ),
        Container(
          alignment: Alignment.center,
          height: 29,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
              color: AppColors.textBackgroundColor,
            ),
          ),
          child: const Text('توضیحات'),
        ),
      ],
    );
  }

  Widget _tabBarView(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        _specificationsTabView(context),
        _priceTabView(context),
        _propertiesAndFacilitiesTabView(context),
        _notesTabView(context),
      ],
    );
  }

  Widget _specificationsTabView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          // specification container:
          Container(
            height: 98,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColors.borderColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'متراژ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '500',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
                DottedLine(
                  lineLength: 48,
                  dashColor: AppColors.borderColor,
                  direction: Axis.vertical,
                  dashGapLength: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'اتاق',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '6',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
                DottedLine(
                  lineLength: 48,
                  dashColor: AppColors.borderColor,
                  direction: Axis.vertical,
                  dashGapLength: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'طبقه',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'دوبلکس',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
                DottedLine(
                  lineLength: 48,
                  dashColor: AppColors.borderColor,
                  direction: Axis.vertical,
                  dashGapLength: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ساخت',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '1402',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.black,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          //
          // location:
          Row(
            children: [
              Image.asset('assets/images/mapIcon.png'),
              const SizedBox(
                width: 8,
              ),
              Text(
                'موقعیت مکانی',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Image.asset(
            'assets/images/mapPreview.png',
          ),
        ],
      ),
    );
  }

  Widget _priceTabView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: 96,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'قیمت هر متر',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(),
                Text(
                  46460000.changeToPrice(),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontFamily: 'SM',
                      ),
                ),
              ],
            ),
            DottedLine(
              lineLength: 311,
              dashLength: 5,
              dashGapLength: 5,
              dashColor: AppColors.borderColor,
            ),
            Row(
              children: [
                Text(
                  'قیمت کل',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Spacer(),
                Text(
                  23230000000.changeToPrice(),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontFamily: 'SM',
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _propertiesAndFacilitiesTabView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          _propertiesSection(context),
          const SizedBox(
            height: 32,
          ),
          _facilitiesSection(context),
        ],
      ),
    );
  }

  Widget _propertiesSection(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'سند',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      'تک برگ',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                  ],
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'جهت ساختمان',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      'شمالی',
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: AppColors.lightGrey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _facilitiesSection(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'آسانسور',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'پارکینگ',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'انباری',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'بالکن',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'پنت هاوس',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'جنس کف سرامیک',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
              DottedLine(
                lineLength: 311,
                dashLength: 5,
                dashGapLength: 5,
                dashColor: AppColors.borderColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'سرویس بهداشتی ایرانی و فرنگی',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.lightGrey,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _notesTabView(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Text(
        'ویلا ۵۰۰ متری در خیابان صیاد شیرازی ویو عالی وسط جنگل قیمت فوق العاده گذاشتم فروش فوری خریدار باشی تخفیف پای معامله میدم.',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.lightGrey,
              height: 1.5,
            ),
      ),
    );
  }
}
