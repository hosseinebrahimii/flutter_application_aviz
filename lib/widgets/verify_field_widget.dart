import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class VerifyFieldWidget extends StatefulWidget {
  VerifyFieldWidget({
    super.key,
  });

  //this property is responsible for moving cursor automatically to next textfields
  //after we fill them, we have 4 focusNodes because we have 4 textfields.
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  //this property is responsible forgetting data inside textfields,
  // we have 4 controllers because we have 4 textfields.
  final List<TextEditingController> controllers = List.generate(4, (index) => TextEditingController(text: ''));

  //this is the code we need to verify the user,
  //we can access this from outside this class.
  static String code = '';
  @override
  State<VerifyFieldWidget> createState() => _VerifyFieldWidgetState();
}

class _VerifyFieldWidgetState extends State<VerifyFieldWidget> {
  //this parameter changes the color of the field if it is filled
  List<bool> isFilled = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int i = 0; i < 4; i++) ...{
          SizedBox(
            width: 74,
            height: 48,
            child: TextFormField(
              focusNode: widget.focusNodes[i],
              controller: widget.controllers[i],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              maxLines: 1,
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: (isFilled[i])
                    ? AppColors.textFormFieldWithNumberBackgroundColor
                    : AppColors.textFormFieldWithoutNumberBackgroundColor,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                //when adding number:
                if (value.length == 1) {
                  if (i != 3) {
                    widget.focusNodes[i + 1].requestFocus();
                  } else {
                    widget.focusNodes[i].unfocus();
                  }
                  VerifyFieldWidget.code = VerifyFieldWidget.code + widget.controllers[i].text;
                  setState(() {
                    isFilled[i] = true;
                  });
                }
                // when removing number:
                if (value.isEmpty) {
                  if (i != 0) {
                    widget.focusNodes[i - 1].requestFocus();
                  } else {
                    widget.focusNodes[i].unfocus();
                  }
                  VerifyFieldWidget.code = VerifyFieldWidget.code.substring(0, VerifyFieldWidget.code.length - 1);
                  setState(() {
                    isFilled[i] = false;
                  });
                }
              },
            ),
          ),
        },
      ],
    );
  }
}
