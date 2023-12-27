import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  // this parameter is used to get the category from this widget,
  static String selectedCategory = '';

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  final _controller = ExpansionTileController();
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return SizedBox(
      width: 159,
      // height: 48,
      child: ExpansionTile(
        controller: _controller,
        tilePadding: const EdgeInsets.symmetric(horizontal: 12),
        shape: Border.all(width: 1, color: AppColors.borderColor),
        collapsedShape: Border.all(width: 1, color: AppColors.borderColor),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        trailing: _trailingWidget(),
        title: _titleWidget(context),
        childrenPadding: const EdgeInsets.symmetric(vertical: 5),
        children: _childrenWidget(context),
      ),
    );
  }

  AnimatedRotation _trailingWidget() {
    return AnimatedRotation(
      turns: isExpanded ? 0.5 : 0,
      duration: const Duration(milliseconds: 200),
      child: Image.asset(
        'assets/images/arrowDown.png',
      ),
    );
  }

  Container _titleWidget(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.centerRight,
      child: Text(
        CategorySelection.selectedCategory,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  List<Widget> _childrenWidget(BuildContext context) {
    return [
      _childWidget(context, 'فروش آپارتمان'),
      _childWidget(context, 'فروش خانه و ویلا'),
      _childWidget(context, 'فروش زمین و کلنگی'),
    ];
  }

  GestureDetector _childWidget(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          CategorySelection.selectedCategory = title;
          _controller.collapse();
        });
      },
      child: Container(
        width: 159,
        height: 40,
        color: (CategorySelection.selectedCategory == title) ? AppColors.borderColor : AppColors.backgroundColor,
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
