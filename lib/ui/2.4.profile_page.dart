import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/widgets/cached_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _avizAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                    width: double.infinity,
                  ),
                  _searchTextField(context),
                  const SizedBox(
                    height: 32,
                  ),
                  _profileSectionHeader(context),
                  const SizedBox(
                    height: 24,
                  ),
                  _basicInfoContainer(context),
                  const SizedBox(
                    height: 32,
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.textBackgroundColor,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ..._profileSections(context),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: 34,
                    height: 42,
                    child: Text(
                      'نسخه 1.5.9',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontFamily: 'SM',
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _avizAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 42,
      backgroundColor: AppColors.backgroundColor,
      title: Image.asset(
        'assets/images/avizAppBar.png',
        height: 42,
      ),
    );
  }

  TextField _searchTextField(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headlineLarge,
      decoration: InputDecoration(
        filled: false,
        prefixIcon: Image.asset('assets/images/searchIcon.png'),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        hintText: 'جستجو...',
        hintStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: AppColors.lighterGrey,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.borderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.lighterGrey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }

  Row _profileSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/profileIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'حساب کاربری',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Container _basicInfoContainer(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: SizedBox(
              height: 56,
              width: 56,
              child: ClipPath(
                clipper: ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(75),
                    ),
                  ),
                ),
                child: CachedImage(),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'حسین ابراهیمی',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.black,
                    ),
              ),
              Row(
                children: [
                  Text(
                    '09123456789',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.black,
                          fontFamily: 'SM',
                        ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 26,
                    width: 66,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'تایید شده',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColors.backgroundColor,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Image.asset('assets/images/editIcon.png'),
        ],
      ),
    );
  }

  List<Widget> _profileSections(BuildContext context) {
    return [
      _profileSectionContainer(
        context,
        title: 'آگهی‌های من',
        iconAddress: 'assets/images/noteIcon.png',
      ),
      const SizedBox(
        height: 16,
      ),
      _profileSectionContainer(
        context,
        title: 'پرداخت‌های من',
        iconAddress: 'assets/images/cardIcon.png',
      ),
      const SizedBox(
        height: 16,
      ),
      _profileSectionContainer(
        context,
        title: 'بازدید‌های اخیر',
        iconAddress: 'assets/images/eyeIcon.png',
      ),
      const SizedBox(
        height: 16,
      ),
      _profileSectionContainer(
        context,
        title: 'ذخیره شده‌ها',
        iconAddress: 'assets/images/saveIcon.png',
      ),
      const SizedBox(
        height: 16,
      ),
      _profileSectionContainer(
        context,
        title: 'تنظیمات',
        iconAddress: 'assets/images/settingIcon.png',
      ),
      const SizedBox(
        height: 16,
      ),
      _profileSectionContainer(
        context,
        title: 'پشتیبانی و قوانین',
        iconAddress: 'assets/images/supportIcon.png',
      ),
      const SizedBox(
        height: 16,
      ),
      _profileSectionContainer(
        context,
        title: 'درباره آویز',
        iconAddress: 'assets/images/infoIcon2.png',
      ),
    ];
  }

  Widget _profileSectionContainer(
    BuildContext context, {
    required String title,
    required String iconAddress,
  }) {
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
            Image.asset(iconAddress),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
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
}
