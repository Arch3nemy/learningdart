import 'package:flutter/material.dart';
import 'package:learningdart/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:learningdart/constants.dart' as constants;

class WelcomeText extends StatelessWidget {
  final MyTextStyles textStyles;

  const WelcomeText({super.key, required this.textStyles});

  @override
  Widget build(Object context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(constants.WELCOME_BACK, style: textStyles.welcomeTitle),
      SizedBox(height: 4.w),
      const Text(constants.LOREM_IPSUM,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF78828A)))
    ]);
  }
}
