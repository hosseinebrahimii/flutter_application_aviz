import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 56,
                width: double.infinity,
              ),
              _boardingPageView(),
              const Spacer(),
              _buttons(),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boardingPageView() {
    return Column(
      children: [
        Image.asset(
          'assets/images/onboarding_page/onboarding1.jpg',
          width: 225,
          height: 225,
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'اینجا محل',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/onboarding_page/onboarding2.jpg',
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'آگهی شماست',
              style: TextStyle(
                fontFamily: 'Shabnam',
                fontWeight: FontWeight.w700,
                color: Color(0xFF101828),
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Shabnam',
              color: AppColors.subtitleColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Row _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _signUpButton(),
        const SizedBox(
          width: 25,
        ),
        _signInButton(),
      ],
    );
  }

  ElevatedButton _signUpButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('ثبت نام'),
    );
  }

  OutlinedButton _signInButton() {
    return OutlinedButton(
      onPressed: () {},
      child: const Text('ورود'),
    );
  }
}
