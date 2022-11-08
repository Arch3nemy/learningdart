import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors(
      {required this.colorAccent,
      required this.secondary,
      required this.grey,
      required this.black,
      required this.white,
      required this.lightRed});

  const MyColors.dark(
      {this.colorAccent = const Color(0xFF980000),
      this.secondary = Colors.blue,
      this.grey = const Color(0xFF78828A),
      this.black = Colors.black,
      this.white = Colors.white,
      this.lightRed = Colors.red});

  const MyColors.light(
      {this.colorAccent = const Color(0xFF980000),
      this.secondary = Colors.blue,
      this.grey = const Color(0xFF78828A),
      this.black = Colors.black,
      this.white = Colors.white,
      this.lightRed = Colors.red});

  final Color colorAccent;
  final Color secondary;
  final Color white;
  final Color grey;
  final Color black;
  final Color lightRed;

  @override
  MyColors copyWith(
      {Color? colorAccent,
      Color? secondary,
      Color? white,
      Color? grey,
      Color? black,
      Color? lightRed}) {
    return MyColors(
      colorAccent: colorAccent ?? this.colorAccent,
      secondary: secondary ?? this.secondary,
      grey: grey ?? this.grey,
      black: black ?? this.black,
      white: white ?? this.white,
      lightRed: lightRed ?? this.lightRed,
    );
  }

  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      colorAccent:
          Color.lerp(colorAccent, other.colorAccent, t) ?? Colors.black,
      secondary: Color.lerp(secondary, other.secondary, t) ?? Colors.black,
      grey: Color.lerp(grey, other.grey, t) ?? const Color(0xFF78828A),
      black: Color.lerp(black, other.black, t) ?? Colors.black,
      white: Color.lerp(white, other.white, t) ?? Colors.white,
      lightRed: Color.lerp(lightRed, other.lightRed, t) ?? Colors.red,
    );
  }

  // Optional
  @override
  String toString() =>
      'MyColors(colorAccent: $colorAccent, secondary color: $secondary , grey: $grey, black: $black, white $white, lightRed $lightRed)';
}

@immutable
class MyTextStyles extends ThemeExtension<MyTextStyles> {
  const MyTextStyles({
    required this.defaultText,
    required this.loginButton,
    required this.dontHaveAccountTextField,
    required this.defaultRedText,
    required this.signInWithText,
    required this.welcomeTitle,
  });

  const MyTextStyles.defaultTextStyles(
      {this.defaultText = const TextStyle(fontSize: 18, color: Colors.black),
      this.loginButton = const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      this.dontHaveAccountTextField =
          const TextStyle(fontSize: 18, color: Color(0xFF78828A)),
      this.defaultRedText =
          const TextStyle(fontSize: 18, color: Color(0xFF980000)),
      this.signInWithText =
          const TextStyle(fontSize: 15, color: Color(0xFF78828A)),
      this.welcomeTitle =
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 27)});

  final TextStyle? defaultText;
  final TextStyle? loginButton;
  final TextStyle? defaultRedText;
  final TextStyle? dontHaveAccountTextField;
  final TextStyle? signInWithText;
  final TextStyle? welcomeTitle;

  @override
  MyTextStyles copyWith(
      {TextStyle? defaultText,
      TextStyle? loginButton,
      TextStyle? defaultRedText,
      TextStyle? signInWithText,
      TextStyle? dontHaveAccountTextField,
      TextStyle? welcomeTitle}) {
    return MyTextStyles(
      defaultText: defaultText ?? this.defaultText,
      loginButton: loginButton ?? this.loginButton,
      defaultRedText: defaultRedText ?? this.defaultRedText,
      signInWithText: signInWithText ?? this.signInWithText,
      dontHaveAccountTextField:
          dontHaveAccountTextField ?? this.dontHaveAccountTextField,
      welcomeTitle: welcomeTitle ?? this.welcomeTitle,
    );
  }

  @override
  MyTextStyles lerp(ThemeExtension<MyTextStyles>? other, double t) {
    if (other is! MyTextStyles) {
      return this;
    }
    return MyTextStyles(
      defaultText: TextStyle.lerp(defaultText, other.defaultText, t),
      loginButton: TextStyle.lerp(loginButton, other.loginButton, t),
      defaultRedText: TextStyle.lerp(defaultRedText, other.defaultRedText, t),
      signInWithText: TextStyle.lerp(signInWithText, other.signInWithText, t),
      dontHaveAccountTextField: TextStyle.lerp(
          dontHaveAccountTextField, other.dontHaveAccountTextField, t),
      welcomeTitle: TextStyle.lerp(welcomeTitle, other.welcomeTitle, t),
    );
  }

  // Optional
  @override
  String toString() => '''
  MyTextStyles(defaultText $defaultText, loginButton $loginButton, 
    defaultRedText $defaultRedText, signInWithText $signInWithText, dontHaveAccountTextField $dontHaveAccountTextField, welcomeTitle $welcomeTitle)''';
}

@immutable
class CustomInputDecoration {
  static InputDecoration getInputDecoration(String? labelText) {
    return InputDecoration(
      labelText: labelText ?? 'default',
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
  }
}

class AppTheme {
  final _darkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const MyColors.dark(),
      const MyTextStyles.defaultTextStyles(),
    ],
  );

  final _lightTheme = ThemeData.light().copyWith(extensions: [
    const MyColors.light(),
    const MyTextStyles.defaultTextStyles(),
  ]);

  final appThemeStream = BehaviorSubject<ThemeData>(sync: true);

  //Add screen whe user can switch theme and watch on the value
  ThemeData getTheme() => appThemeStream.value;

  AppTheme() {
    //add initial value
    appThemeStream.add(_lightTheme);

    final prefs = SharedPreferences.getInstance();

    prefs.then((storage) {
      final value = storage.get('themeMode');

      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        appThemeStream.add(_lightTheme);
      } else {
        appThemeStream.add(_darkTheme);
      }
    });
  }

  void setDarkMode() async {
    appThemeStream.add(_darkTheme);
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('themeMode', 'dark');
  }

  void setLightMode() async {
    appThemeStream.add(_lightTheme);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', 'light');
  }
}
