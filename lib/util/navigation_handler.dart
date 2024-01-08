import 'package:flutter/material.dart';

class Navigation {
  static void push(BuildContext context, {required Widget route}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  static void pushReplace(BuildContext context, {required Widget route}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  static void pushAndRemoveUntil(
    BuildContext context, {
    required Widget route,
    bool predicate = false,
  }) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => route,
      ),
      (route) => false,
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
