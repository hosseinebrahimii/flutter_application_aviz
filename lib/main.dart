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
        // inputDecotionTheme for TextField:
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textFieldHintColor,
          ),
          filled: true,
          fillColor: AppColors.textFieldBackgroundColor,
          border: InputBorder.none,
        ),
        //
        // ElevatedButton theme:
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColorRed,
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
            foregroundColor: AppColors.buttonColorRed,
            side: BorderSide(
              color: AppColors.buttonColorRed,
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
            color: AppColors.black,
            fontSize: 16,
          ),
          // some titles: SM 500 14
          titleSmall: TextStyle(
            fontFamily: 'SM',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.red,
          ),
          // main body descriptions: Shabnam 400 16
          bodyLarge: TextStyle(
            fontFamily: 'Shabnam',
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.5,
          ),
          // some descriptions : Shabnam 400 14
          bodySmall: TextStyle(
            fontFamily: 'Shabnam',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.lighterGrey,
          ),
        ),
      ),
      home: const SignInPage(),
    );
  }
}
