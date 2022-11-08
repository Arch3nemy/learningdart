import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learningdart/views/labeled_check_box.dart';
import 'package:learningdart/views/rounded_text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:learningdart/constants.dart' as constants;
import 'package:learningdart/app_theme.dart';

class Login extends StatefulWidget {
  final MyTextStyles textStyles;
  final MyColors colors;

  const Login({super.key, required this.textStyles, required this.colors});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  late String _email;
  late String _password;

  _updateEmail(String? text) {
    setState(() => _email = text.toString());
  }

  _updatePassword(String? text) {
    setState(() => _password = text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.w,
      runSpacing: 2.w,
      children: [
        Text(constants.EMAIL,
            style: widget.textStyles.defaultText
                ?.copyWith(fontWeight: FontWeight.bold)),
        RoundedTextField(
          onTextChanged: (text) => _updateEmail(text),
          hintText: constants.ENTER_EMAIL,
          colors: widget.colors,
        ),
        Text(constants.PASSWORD,
            style: widget.textStyles.defaultText
                ?.copyWith(fontWeight: FontWeight.bold)),
        RoundedTextField(
          onTextChanged: (text) => _updatePassword(text),
          hintText: constants.ENTER_PASSWORD,
          colors: widget.colors,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledCheckbox(
              label: constants.REMEMBER_ME,
              textStyles: widget.textStyles,
            ),
            GestureDetector(
              onTap: null,
              child: Text(constants.FORGOT_PASSWORD,
                  style: widget.textStyles.defaultText
                      ?.copyWith(color: widget.colors.lightRed)),
            )
          ],
        ),
        SizedBox(height: 1.w),
        Material(
          color: widget.colors.colorAccent,
          borderRadius: BorderRadius.circular(25),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(35),
            child: Container(
              height: 15.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child:
                  Text(constants.SIGN_IN, style: widget.textStyles.loginButton),
            ),
          ),
        ),
      ],
    );
  }
}
