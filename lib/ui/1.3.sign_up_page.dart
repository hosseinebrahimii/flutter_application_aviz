import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/ui/1.1.sign_in_page.dart';
import 'package:flutter_application_aviz/ui/1.4.sign_up_verify_page.dart';
import 'package:flutter_application_aviz/util/navigation_handler.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _numberController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 57,
                  width: double.infinity,
                ),
                title(context),
                const SizedBox(
                  height: 32,
                ),
                nameTextField(
                  context,
                  _nameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                phoneNumberTextField(
                  context,
                  _numberController,
                ),
                const Spacer(),
                nextStepButton(context),
                const SizedBox(
                  height: 16,
                ),
                signInText(context),
                const SizedBox(
                  height: 16,
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
        Row(
          children: [
            Text(
              'خوش اومدی به',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset('assets/images/aviz.png')
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Text(
          'این فوق العادست که آویزو برای آگهی هات انتخاب کردی!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget nameTextField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          //other decoration options were tuned in theme in them main.dart file
          hintText: 'نام و نام خانوادگی',
        ),
      ),
    );
  }

  Widget phoneNumberTextField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          //other decoration options were tuned in theme in them main.dart file
          hintText: 'شماره موبایل',
        ),
      ),
    );
  }

  Widget nextStepButton(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigation.push(
            context,
            route: const SignUpVerifyPage(),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('مرحله بعد'),
            Image.asset('assets/images/arrowLeft.png'),
          ],
        ),
      ),
    );
  }

  Widget signInText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.pushReplace(
          context,
          route: SignInPage(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'قبلاً ثبت‌نام کردی؟',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'ورود',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
