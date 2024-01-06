import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/ui/3.1.registered_ad_page.dart.dart';
import 'package:flutter_application_aviz/widgets/horizontal_ad_card.dart';
import 'package:flutter_application_aviz/widgets/vertical_ad_card.dart';

class AvizAdsPage extends StatelessWidget {
  const AvizAdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _avizAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: _hotAds(context),
                )
              ];
            },
            body: _recentAds(context),
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

  Column _hotAds(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'آویزهای داغ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Text(
                'مشاهده همه',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            //padding is only 'right' because on the end left, we have sizedBox with 16 width.
            padding: const EdgeInsets.only(right: 16),
            itemBuilder: (BuildContext context, int index) {
              return VerticalAdCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisteredAdPage(),
                    ),
                  );
                },
                imageUrl: '',
                title: 'ویلا 500 متری زیر قیمت',
                body: 'ویو عالی، سند تک برگ، سال ساخت ۱۴۰۲، تحویل فوری',
                price: 48000000000,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _recentAds(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'آویزهای اخیر',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Text(
                'مشاهده همه',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Flexible(
          child: ListView.builder(
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return HorizontalAdCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisteredAdPage(),
                    ),
                  );
                },
                imageUrl: '',
                title: 'واحد دوبلکس فول امکانات',
                body: 'سال ساخت ۱۳۹۸، سند تک برگ، دوبلکس تجهیزات کامل',
                price: 8200000000,
              );
            },
          ),
        ),
      ],
    );
  }
}
