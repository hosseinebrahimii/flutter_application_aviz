import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/widgets/item_checker.dart';
import 'package:flutter_application_aviz/widgets/progress_indicator.dart';

class RegisterAdLocationPage extends StatelessWidget {
  const RegisterAdLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _registerAppBar(),
      body: _body(context),
    );
  }

  SafeArea _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 32,
              ),
              _mapSectionHeader(context),
              const SizedBox(
                height: 16,
              ),
              Text(
                'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.lightGrey,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                'assets/images/mapPreview.png',
              ),
              const SizedBox(
                height: 32,
              ),
              const ItemChecker(title: 'موقعیت دقیق نقشه نمایش داده شود؟'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 40,
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
        child: ProgressIndicatorWidget(percentage: 80),
      ),
    );
  }

  Widget _mapSectionHeader(BuildContext context) {
    return Row(
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
    );
  }
}
