import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_colors.dart';

class AppThemes {
  static ThemeData mainTheme() {
    return ThemeData(
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
        // SB 700 16 black
        titleLarge: TextStyle(
          fontFamily: 'SB',
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          fontSize: 16,
        ),
        // SM 500 14 red
        titleSmall: TextStyle(
          fontFamily: 'SM',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.red,
        ),
        // Shabnam 400 15 lightGrey
        bodyLarge: TextStyle(
          fontFamily: 'Shabnam',
          color: AppColors.lightGrey,
          fontWeight: FontWeight.w400,
          fontSize: 15,
          height: 1.5,
        ),
        // Shabnam 500 14 lighterGrey
        bodyMedium: TextStyle(
          fontFamily: 'Shabnam',
          color: AppColors.lighterGrey,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        // Shabnam 400 14 lighterGrey
        bodySmall: TextStyle(
          fontFamily: 'Shabnam',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.lighterGrey,
        ),
      ),
    );
  }

  static ThemeData secondaryTheme = ThemeData(
    textTheme: TextTheme(
      // SM 500 18 black
      titleLarge: TextStyle(
        fontFamily: 'SM',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColors.black,
      ),
      // SM 500 14 black
      titleMedium: TextStyle(
        fontFamily: 'SM',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.black,
      ),
      // SM 500 18 lighterGrey
      bodyLarge: TextStyle(
        fontFamily: 'SM',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColors.lighterGrey,
      ),
    ),
  );
}