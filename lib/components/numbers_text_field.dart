import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NumbersTextField extends StatelessWidget {
  const NumbersTextField(
      {super.key,
      required this.inputDecoration,
      required this.onChanged,
      required this.maxLength,
      required this.controller,
      required this.hint,
      required this.textInputType});

  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final int maxLength;
  final void Function() onChanged;
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: controller,
      keyboardType: textInputType,
      maxLength: maxLength,
      decoration: inputDecoration.copyWith(
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
      ),
      onChanged:(v)=> onChanged(),
    );
  }
}
