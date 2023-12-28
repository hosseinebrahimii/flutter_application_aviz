import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/widgets/item_checker.dart';
import 'package:flutter_application_aviz/widgets/progress_indicator.dart';

class RegisterAdDetail2Page extends StatelessWidget {
  const RegisterAdDetail2Page({super.key});
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController(text: '');
    var captionController = TextEditingController(text: '');

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _registerAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                    width: double.infinity,
                  ),
                  _imageSectionHeader(context),
                  const SizedBox(
                    height: 24,
                  ),
                  _imageAddSection(context),
                  const SizedBox(
                    height: 32,
                  ),
                  _titleSectionHeader(context),
                  const SizedBox(
                    height: 24,
                  ),
                  _titleTextField(context, titleController),
                  const SizedBox(
                    height: 32,
                  ),
                  _captionSectionHeader(context),
                  const SizedBox(
                    height: 24,
                  ),
                  _captionTextField(context, captionController),
                  const SizedBox(
                    height: 32,
                  ),
                  const ItemChecker(title: 'فعال کردن گفتگو'),
                  const SizedBox(
                    height: 16,
                  ),
                  const ItemChecker(title: 'فعال کردن تماس'),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ثبت آگهی'),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
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
        child: ProgressIndicatorWidget(percentage: 100),
      ),
    );
  }

  Widget _imageSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/cameraIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'تصویر آویز',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Container _imageAddSection(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: DottedDecoration(
        shape: Shape.box,
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'لطفا تصویر آویز خود را بارگزاری کنید',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.lightGrey,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 149,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/pictureSelectionIcon.png'),
                  const Text('انتخاب تصویر'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _titleSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/avizTitleIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'عنوان آویز',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Widget _titleTextField(BuildContext context, TextEditingController controller) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          //other decoration options were tuned in theme in them main.dart file
          hintText: 'عنوان آویز را وارد کنید',
        ),
      ),
    );
  }

  Widget _captionSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/captionIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'توضیحات',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Widget _captionTextField(BuildContext context, TextEditingController controller) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: TextField(
        controller: controller,
        maxLines: 4,
        decoration: const InputDecoration(
          //other decoration options were tuned in theme in them main.dart file
          hintText: 'توضیحات آویز را وارد کنید',
        ),
      ),
    );
  }
}
