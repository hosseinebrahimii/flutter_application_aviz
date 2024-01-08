import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/ui/2.0.main_page.dart';
import 'package:flutter_application_aviz/util/navigation_handler.dart';
import 'package:flutter_application_aviz/widgets/resend_code_verifier.dart';
import 'package:flutter_application_aviz/widgets/verify_field_widget.dart';

class SignUpVerifyPage extends StatelessWidget {
  const SignUpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 56,
                  width: double.infinity,
                ),
                //verifying description:
                title(context),
                const SizedBox(
                  height: 32,
                ),
                //TextFormField for placing 4 digit code:
                VerifyFieldWidget(),
                const SizedBox(
                  height: 35,
                ),
                //45 seconds count down with a resend code button:
                ResendCodeVerifier(
                  timer: 45,
                  onTap: () {},
                ),
                const Spacer(),
                //a button for applying and verifying the 4 digit code:
                applyButton(context),
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

  Widget title(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تایید شماره موبایل',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'کد ثبت‌نام پیامک شده را وارد کنید',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget applyButton(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (VerifyFieldWidget.code.length == 4) {
            Navigation.pushAndRemoveUntil(
              context,
              route: const MainPage(),
            );
          }
        },
        child: const Text('تایید ثبت ‌نام'),
      ),
    );
  }
}
