import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';
import 'package:flutter_application_aviz/ui/1.1.sign_in_page.dart';

void main() {
  runApp(const AvizApp());
}

class AvizApp extends StatelessWidget {
  const AvizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aviz',
      theme: ThemeData(
        //
        // ElevatedButton theme:
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            elevation: 0,
            textStyle: const TextStyle(
              fontFamily: 'SM',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            foregroundColor: AppColors.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        //
        // OutlinedButton theme:
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: const TextStyle(
              fontFamily: 'SM',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            foregroundColor: AppColors.buttonColor,
            side: BorderSide(
              color: AppColors.buttonColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        //
        // Text themes:
        textTheme: TextTheme(
          // main titles: SB 700 16
          titleLarge: TextStyle(
            fontFamily: 'SB',
            fontWeight: FontWeight.w700,
            color: AppColors.maintitleColor,
            fontSize: 16,
          ),
          // main body descriptions: Shabnam 400 16
          bodyLarge: TextStyle(
            fontFamily: 'Shabnam',
            color: AppColors.subtitleColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ),
      home: const SignInPage(),
    );
  }
}
