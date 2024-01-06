import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/ui/2.1.aviz_ads_page.dart';
import 'package:flutter_application_aviz/ui/2.2.0.register_ad_category1_page.dart';
import 'package:flutter_application_aviz/ui/2.4.profile_page.dart';

//
// this page controlls all the other pages and connects them with navigationBar.
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: _bottomNavigationBar(),
        body: SafeArea(
          // we want the pages to change fluently, so we use animations.
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: IndexedStack(
              index: currentIndex,
              key: UniqueKey(), // without key, animations won't work.
              children: [
                // we use visibility widget to improve performance of the app
                // we don't need background pages to be proccessed
                Visibility(
                  visible: currentIndex == 0,
                  child: const AvizAdsPage(),
                ),
                Visibility(
                  visible: currentIndex == 1,
                  child: Container(),
                ),
                Visibility(
                  visible: currentIndex == 2,
                  child: RegisterAdCategory1Page(),
                ),

                Visibility(
                  visible: currentIndex == 3,
                  child: const ProfilePage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return SizedBox(
      height: 65,
      child: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: Theme.of(context).textTheme.titleSmall,
        selectedItemColor: AppColors.red,
        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
        unselectedItemColor: AppColors.lighterGrey,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/avizDeactive.png'),
            activeIcon: Image.asset('assets/images/avizActive.png'),
            label: 'آویز آگهی‌ها',
            backgroundColor: AppColors.textBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/searchDeactive.png'),
            activeIcon: Image.asset('assets/images/searchActive.png'),
            label: 'جستجو',
            backgroundColor: AppColors.textBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/addDeactive.png'),
            activeIcon: Image.asset('assets/images/addActive.png'),
            label: 'افزودن آویز',
            backgroundColor: AppColors.textBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profileDeactive.png'),
            activeIcon: Image.asset('assets/images/profileActive.png'),
            label: 'آویز من',
            backgroundColor: AppColors.textBackgroundColor,
          ),
        ],
      ),
    );
  }
}
