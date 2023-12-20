import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_themes.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ResendCodeVerifier extends StatefulWidget {
  const ResendCodeVerifier({
    super.key,
    required this.timer,
    this.onTap,
  });
  final int timer;
  final void Function()? onTap;
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
            return timeFormatChecker(time);
          },
          interval: const Duration(milliseconds: 100),
          onFinished: () {
            setState(() {});
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
}

Text timeFormatChecker(double time) {
  //more than 1 min:
  if (time >= 60) {
    double minuteCounter = (time / 60).floorToDouble();
    double secondCounter = time - minuteCounter * 60;
    if (minuteCounter < 10 && secondCounter < 10) {
      return Text(
        '0${minuteCounter.toStringAsFixed(0)}:0${secondCounter.toStringAsFixed(0)}',
        style: AppThemes.secondaryTheme.textTheme.titleLarge,
      );
    } else if (secondCounter < 10) {
      return Text(
        '${minuteCounter.toStringAsFixed(0)}:0${secondCounter.toStringAsFixed(0)}',
        style: AppThemes.secondaryTheme.textTheme.titleLarge,
      );
    } else if (minuteCounter < 10) {
      return Text(
        '0${minuteCounter.toStringAsFixed(0)}:${secondCounter.toStringAsFixed(0)}',
        style: AppThemes.secondaryTheme.textTheme.titleLarge,
      );
    } else {
      return Text(
        '${minuteCounter.toStringAsFixed(0)}:${secondCounter.toStringAsFixed(0)}',
        style: AppThemes.secondaryTheme.textTheme.titleLarge,
      );
    }
  }
  // less than 1 min:
  else if (time > 0) {
    if (time < 10) {
      return Text(
        '00:0${time.toStringAsFixed(0)}',
        style: AppThemes.secondaryTheme.textTheme.titleLarge,
      );
    } else {
      return Text(
        '00:${time.toStringAsFixed(0)}',
        style: AppThemes.secondaryTheme.textTheme.titleLarge,
      );
    }
  }
  //time == 0
  else {
    return Text(
      '00:00',
      style: AppThemes.secondaryTheme.textTheme.bodyLarge,
    );
  }
}
