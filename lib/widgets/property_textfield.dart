import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

// this widget is a combination of textfield and 2 buttons for increasing and decreansing its data,
// it is used for getting information from customers about their real state.
class PropertyTextField extends StatefulWidget {
  const PropertyTextField({
    super.key,
    required this.hint,
  });
  final String hint;
  static int value = 0;
  @override
  State<PropertyTextField> createState() => _PropertyTextFieldState();
}

class _PropertyTextFieldState extends State<PropertyTextField> {
  final _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    const int step = 1;
    Timer periodicTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {});

    return Container(
      width: 159,
      height: 48,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.textFieldBackgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _textField(context),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _upButton(
                periodicTimer,
                PropertyTextField.value,
                step,
              ),
              _downButton(
                periodicTimer,
                PropertyTextField.value,
                step,
              ),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  Flexible _textField(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: _controller,
        style: Theme.of(context).textTheme.headlineLarge,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: widget.hint,
        ),
      ),
    );
  }

  GestureDetector _upButton(Timer periodicTimer, int number, int step) {
    return GestureDetector(
      onLongPressStart: (details) {
        periodicTimer = Timer.periodic(
          const Duration(milliseconds: 100),
          (timer) {
            number = (_controller.text == '') ? 0 : int.parse(_controller.text);
            _controller.text = (number + step).toString();
            if (periodicTimer.tick == 20) {
              periodicTimer.cancel();
              periodicTimer = Timer.periodic(
                const Duration(milliseconds: 50),
                (timer) {
                  number = int.parse(_controller.text);
                  _controller.text = (number + step).toString();
                },
              );
            }
          },
        );
      },
      onLongPressEnd: (details) {
        periodicTimer.cancel();
      },
      onTap: () {
        if (_controller.text != '') {
          number = int.parse(_controller.text);
          _controller.text = (number + step).toString();
        } else {
          _controller.text = step.toString();
        }
      },
      child: Image.asset(
        'assets/images/pointUp.png',
        width: 8,
        height: 8,
      ),
    );
  }

  GestureDetector _downButton(Timer periodicTimer, int number, int step) {
    return GestureDetector(
      onLongPressStart: (details) {
        periodicTimer = Timer.periodic(
          const Duration(milliseconds: 100),
          (timer) {
            number = (_controller.text == '') ? 0 : int.parse(_controller.text);
            _controller.text = (number == 0) ? '' : (number - step).toString();
            if (periodicTimer.tick == 20) {
              periodicTimer.cancel();
              periodicTimer = Timer.periodic(
                const Duration(milliseconds: 50),
                (timer) {
                  number = (_controller.text == '') ? 0 : int.parse(_controller.text);
                  _controller.text = (number == 0) ? '' : (number - step).toString();
                },
              );
            }
          },
        );
      },
      onLongPressEnd: (details) {
        periodicTimer.cancel();
      },
      onTap: () {
        if (_controller.text != '') {
          number = int.parse(_controller.text);
          if (number <= step) {
            _controller.text = '';
          } else {
            _controller.text = (number - step).toString();
          }
        }
      },
      child: Image.asset(
        'assets/images/pointDown.png',
        width: 8,
        height: 8,
      ),
    );
  }
}
