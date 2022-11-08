// ignore: file_names
import 'package:flutter/material.dart';
import 'package:learningdart/app_theme.dart';

class RoundedTextField extends StatefulWidget {
  final ValueChanged<String?>? onTextChanged;
  final String hintText;
  final bool isPassword;
  final MyColors colors;

  const RoundedTextField({
    Key? key,
    this.onTextChanged,
    this.hintText = '',
    this.isPassword = false,
    required this.colors,
  }) : super(key: key);

  @override
  State<RoundedTextField> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.isPassword,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(color: widget.colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(color: widget.colors.grey, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              borderSide: BorderSide(color: widget.colors.grey, width: 1),
            ),
            hintText: widget.hintText),
        onChanged: (text) => widget.onTextChanged != null ? (text) : () {});
  }
}
