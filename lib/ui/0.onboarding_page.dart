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
              _onboardingPageView(context),
              const Spacer(),
              _buttons(context),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _onboardingPageView(BuildContext context) {
    // this widget gives user initial info about the app
    // before the user signs in or signs up
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              height: 56,
              width: double.infinity,
            ),
            Image.asset(
              'assets/images/onboarding_page/onboardingBackground.png',
              scale: 0.9,
            ),
            Image.asset(
              'assets/images/onboarding_page/onboarding1.png',
              width: 225,
              height: 225,
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'اینجا محل',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/onboarding_page/onboarding2.png',
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'آگهی شماست',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _signUpButton(context),
        const SizedBox(
          width: 25,
        ),
        _signInButton(context),
      ],
    );
  }

  Widget _signUpButton(BuildContext context) {
    return SizedBox(
      width: 159,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: Theme.of(context).elevatedButtonTheme.style,
        child: const Text('ثبت نام'),
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return SizedBox(
      width: 159,
      height: 40,
      child: OutlinedButton(
        onPressed: () {},
        style: Theme.of(context).outlinedButtonTheme.style,
        child: const Text('ورود'),
      ),
    );
  }
}
