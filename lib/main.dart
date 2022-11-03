// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:learningdart/views/Login.dart';
import 'package:learningdart/views/TopRow.dart';
import 'package:learningdart/views/WelcomeText.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign In", style: TextStyle(color: Colors.black)),
          toolbarHeight: 15.h,
          centerTitle: true,
          leadingWidth: 25.w,
          leading: IconButton(
            icon: SvgPicture.asset(
              'images/back_button.svg',
            ),
            onPressed: null,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WelcomeText(),
              SizedBox(height: 50),
              Login(),
            ],
          ),
        ));
  }
}
