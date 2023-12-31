import 'package:flutter/material.dart';
import 'package:flutter_application_aviz/constants/app_themes.dart';
import 'package:flutter_application_aviz/ui/0.onboarding_page.dart';

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
      theme: AppThemes.mainTheme(),
      home: const OnboardingPage(),
    );
  }
}
