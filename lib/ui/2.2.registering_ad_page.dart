import 'package:flutter/material.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/widgets/category_selection.dart';
import 'package:flutter_application_aviz/widgets/item_checker.dart';
import 'package:flutter_application_aviz/widgets/progress_indicator.dart';
import 'package:flutter_application_aviz/widgets/property_textfield.dart';

class RegisterAdPage extends StatefulWidget {
  const RegisterAdPage({super.key});

  @override
  State<RegisterAdPage> createState() => _RegisterAdPageState();
}

class _RegisterAdPageState extends State<RegisterAdPage> {
  int pageSectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _appBar(context),
      body: SafeArea(
        // we want the pages to change fluently, so we use animations.
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: IndexedStack(
              index: pageSectionIndex,
              key: UniqueKey(), // without key, animations won't work.
              children: [
                // we use visibility widget to improve performance of the app
                // we don't need background pages to be proccessed
                Visibility(
                  visible: pageSectionIndex == 0,
                  child: _category1SectionBody(context),
                ),
                Visibility(
                  visible: pageSectionIndex == 1,
                  child: _category2SectionBody(context),
                ),
                Visibility(
                  visible: pageSectionIndex == 2,
                  child: _detail1SectionBody(context),
                ),
                Visibility(
                  visible: pageSectionIndex == 3,
                  child: _locationSectionBody(context),
                ),
                Visibility(
                  visible: pageSectionIndex == 4,
                  child: _detail2SectionBody(
                    context,
                    titleController,
                    captionController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 42,
      backgroundColor: AppColors.backgroundColor,
      title: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // this button goes back 1 section:
          GestureDetector(
            onTap: () {
              setState(() {
                pageSectionIndex == 0 ? null : pageSectionIndex--;
              });
            },
            child: AnimatedOpacity(
              opacity: pageSectionIndex == 0 ? 0.2 : 1,
              duration: const Duration(milliseconds: 100),
              child: Image.asset(
                'assets/images/arrowRight.png',
              ),
            ),
          ),
          Image.asset(
            (pageSectionIndex == 0 || pageSectionIndex == 1)
                ? 'assets/images/avizCategory.png'
                : 'assets/images/registerAviz.png',
            height: 42,
          ),
          // this button cancels the process and goes back to the first section:
          GestureDetector(
            onTap: () {
              setState(() {
                pageSectionIndex = 0;
              });
            },
            child: Image.asset('assets/images/closeSquare.png'),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 4),
        child: ProgressIndicatorWidget(
          percentage: pageSectionIndex == 0
              ? 10
              : pageSectionIndex == 1
                  ? 20
                  : pageSectionIndex == 2
                      ? 40
                      : pageSectionIndex == 3
                          ? 80
                          : 100,
        ),
      ),
    );
  }

// parent and child category section and their related methods and parameters:

  final List<String> category1Names = [
    'اجاره مسکونی',
    'فروش مسکونی',
    'فروش دفاتر اداری و تجاری',
    'اجاره دفاتر اداری و تجاری',
    'اجاره کوتاه مدت',
    'پروژه های ساخت و ساز'
  ];

  final List<String> category2Names = [
    'فروش آپارتمان',
    'فروش خانه و ویلا',
    'فروش زمین و کلنگی',
  ];

  Column _category1SectionBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
          width: double.infinity,
        ),
        ...List.generate(
          category1Names.length,
          (index) {
            return Column(
              children: [
                _categoryItem(context, category1Names[index]),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Column _category2SectionBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
          width: double.infinity,
        ),
        ...List.generate(
          category2Names.length,
          (index) {
            return Column(
              children: [
                _categoryItem(context, category2Names[index]),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _categoryItem(BuildContext context, String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pageSectionIndex++;
        });
      },
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
            Text(
              name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Spacer(),
            Image.asset('assets/images/arrowLeft.png'),
          ],
        ),
      ),
    );
  }

// ----------------------------------------------------------

// detail1 section and their related methods:

  SingleChildScrollView _detail1SectionBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            _categorySectionHeader(context),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _categorySection(context),
                _addressSection(context),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Divider(
              height: 0,
              color: AppColors.textBackgroundColor,
              thickness: 1,
            ),
            const SizedBox(
              height: 32,
            ),
            _propertiesSectionHeader(context),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _areaSection(context),
                _roomSection(context),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _floorSection(context),
                _yearSection(context),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Divider(
              color: AppColors.textBackgroundColor,
              height: 0,
              thickness: 1,
            ),
            const SizedBox(
              height: 32,
            ),
            _facilitiesSectionHeader(context),
            const SizedBox(
              height: 24,
            ),
            _facilitiesItems(),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pageSectionIndex++;
                  });
                },
                child: const Text('بعدی'),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _categorySectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/categoryIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'انتخاب دسته‌بندی آویز',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Column _categorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'دسته‌بندی',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const CategorySelection(),
      ],
    );
  }

  Column _addressSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'محدوده ملک',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 159,
          height: 48,
          child: TextField(
            keyboardType: TextInputType.streetAddress,
            style: Theme.of(context).textTheme.headlineLarge,
            decoration: const InputDecoration(
              hintText: 'خیابان صیاد شیرازی',
            ),
          ),
        ),
      ],
    );
  }

  Row _propertiesSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/propertiesIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'ویژگی‌ها',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Column _areaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'متراژ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '300',
        ),
      ],
    );
  }

  Column _roomSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تعداد اتاق',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '6',
        ),
      ],
    );
  }

  Column _floorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طبقه',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '3',
        ),
      ],
    );
  }

  Column _yearSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'سال ساخت',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 16,
        ),
        const PropertyTextField(
          hint: '1402',
        ),
      ],
    );
  }

  Widget _facilitiesSectionHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/facilitiesIcon.png'),
        const SizedBox(
          width: 8,
        ),
        Text(
          'امکانات',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Column _facilitiesItems() {
    return const Column(
      children: [
        ItemChecker(
          title: 'آسانسور',
        ),
        SizedBox(
          height: 27,
        ),
        ItemChecker(
          title: 'پارکینگ',
        ),
        SizedBox(
          height: 27,
        ),
        ItemChecker(
          title: 'انباری',
        ),
      ],
    );
  }

// ----------------------------------------------------------

// location section and their related methods:

  Padding _locationSectionBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
              onPressed: () {
                setState(() {
                  pageSectionIndex++;
                });
              },
              child: const Text('بعدی'),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
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

// ----------------------------------------------------------

// detail2 section and their related methods and parameters:

  var titleController = TextEditingController(text: '');

  var captionController = TextEditingController(text: '');

  Padding _detail2SectionBody(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController captionController,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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

// ----------------------------------------------------------
}
