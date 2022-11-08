// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learningdart/views/bottom_block.dart';
import 'package:learningdart/views/login.dart';
import 'package:learningdart/views/welcome_text.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningdart/assets/images.dart';
import 'package:learningdart/constants.dart' as Constants;

import 'app_theme.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    const textTheme = MyTextStyles.defaultTextStyles();
    MyColors colors =
        isDarkMode ? const MyColors.dark() : const MyColors.light();

    return MaterialApp(
        title: Constants.SIGN_IN,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          colors: colors,
          textStyles: textTheme,
        ));
  }));
}

class HomePage extends StatefulWidget {
  final MyColors colors;
  final MyTextStyles textStyles;

  const HomePage({Key? key, required this.colors, required this.textStyles})
      : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // avoid resizing widgets while keyboard is up
      appBar: AppBar(
        title: Text(Constants.SIGN_IN,
            style: widget.textStyles.defaultText
                ?.copyWith(color: widget.colors.black)),
        toolbarHeight: 15.h,
        centerTitle: true,
        leadingWidth: 20.w,
        leading: IconButton(
          icon: SvgPicture.asset(
            Images.backButtonImage,
          ),
          onPressed: null,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GestureDetector(
        // touch anywhere to hide keyboard
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(
                textStyles: widget.textStyles,
              ),
              SizedBox(height: 10.w),
              Login(colors: widget.colors, textStyles: widget.textStyles),
              SizedBox(height: 2.w),
              BottomBlock(
                textTheme: widget.textStyles,
              )
            ],
          ),
        ),
      ),
    );
  }
}
