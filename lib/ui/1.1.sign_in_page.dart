import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
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
                phoneNumberTextField(
                  context,
                  _numberController,
                ),
                const Spacer(),
                nextStepButton(),
                const SizedBox(
                  height: 16,
                ),
                signUpText(context),
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
              'ورود به',
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
          'خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget phoneNumberTextField(BuildContext context, TextEditingController controller) {
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

  Widget nextStepButton() {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
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

  Widget signUpText(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تا حالا ثبت نام نکردی؟',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'ثبت نام',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
