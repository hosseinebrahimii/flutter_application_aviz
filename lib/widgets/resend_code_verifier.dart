import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_themes.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ResendCodeVerifier extends StatefulWidget {
  const ResendCodeVerifier({
    super.key,
    required this.timer,
    required this.onTap,
  });
  final int timer;
  final void Function() onTap;
  @override
  State<ResendCodeVerifier> createState() => _ResendCodeVerifierState();
}

CountdownController _controller = CountdownController(autoStart: true);

class _ResendCodeVerifierState extends State<ResendCodeVerifier> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Countdown(
          seconds: widget.timer,
          controller: _controller,
          build: (BuildContext context, double time) {
            return Text(
              timeFormatChecker(time),
              style: time == 0
                  ? AppThemes.secondaryTheme.textTheme.bodyLarge
                  : AppThemes.secondaryTheme.textTheme.titleLarge,
            );
          },
          interval: const Duration(milliseconds: 100),
          onFinished: () {
            setState(() {
              widget.onTap;
            });
          },
        ),
        const SizedBox(
          width: 5,
        ),
        //
        //
        (_controller.isCompleted ?? false)
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.restart();
                  });
                },
                child: Text(
                  'ارسال مجدد کد',
                  style: AppThemes.secondaryTheme.textTheme.titleMedium,
                ),
              )
            : Text(
                'ارسال مجدد کد',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }

// this method returns time in a proper format:
  String timeFormatChecker(double time) {
    //more than 1 min:
    if (time >= 60) {
      int minuteCounter = (time.floor() / 60).floor();
      int secondCounter = time.floor() - minuteCounter * 60;

      if (minuteCounter < 10 && secondCounter < 10) {
        return '0$minuteCounter:0$secondCounter';
      } else if (secondCounter < 10) {
        return '$minuteCounter:0$secondCounter';
      } else if (minuteCounter < 10) {
        return '0$minuteCounter:$secondCounter';
      } else {
        return '$minuteCounter:$secondCounter';
      }
    }
    // less than 1 min:
    else {
      int secondCounter = time.floor();

      if (secondCounter == 60) {
        return '01:00';
      } else if (secondCounter < 10) {
        return '00:0$secondCounter';
      } else {
        return '00:$secondCounter';
      }
    }
  }
}
