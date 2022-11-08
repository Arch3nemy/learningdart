import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningdart/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:learningdart/constants.dart' as constants;
import 'package:learningdart/assets/images.dart';

class BottomBlock extends StatelessWidget {
  const BottomBlock({super.key, required this.textTheme});

  final MyTextStyles textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(constants.DONT_HAVE_ACCOUNT,
            style: textTheme.dontHaveAccountTextField),
        TextButton(
            onPressed: null,
            child: Text(constants.SIGN_UP, style: textTheme.defaultRedText))
      ]),
      Padding(
        padding: EdgeInsets.all(1.0.w),
        child: Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.0.w),
              child:
                  Text(constants.SIGN_IN_WITH, style: textTheme.signInWithText),
            ),
            const Expanded(
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SignInImageButton(imageAsset: Images.googleImage),
          SignInImageButton(imageAsset: Images.appleImage),
          SignInImageButton(imageAsset: Images.facebookImage),
        ],
      )
    ]);
  }
}

class SignInImageButton extends StatelessWidget {
  final String imageAsset;

  const SignInImageButton({required this.imageAsset, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.w,
      child: IconButton(
        icon: SvgPicture.asset(
          imageAsset,
        ),
        onPressed: null,
      ),
    );
  }
}
