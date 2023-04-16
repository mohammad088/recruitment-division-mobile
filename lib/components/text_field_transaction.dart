import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page_view_controller.dart';

// ignore: must_be_immutable
class TextFieldTransaction extends StatelessWidget {
  TextFieldTransaction(
      {super.key,
      required this.keyboardType,
      required this.controller,
      required this.onchange,
      required this.inputDecoration});
  final c = Get.put(PageviewController());
  final TextInputType keyboardType;
  final TextEditingController controller;
  Function onchange;
  final InputDecoration inputDecoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: inputDecoration,
      controller: controller,
      cursorColor: Colors.brown,
      keyboardType: TextInputType.name,
      textDirection: TextDirection.rtl,
      onTap: () {
        if (c.firstNameController.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: c.firstNameController.text.length - 1))) {
          c.firstNameController.selection = TextSelection.fromPosition(
              TextPosition(offset: c.firstNameController.text.length));
          c.update();
        }
      },
      onChanged: (value) {
        onchange();
      },
    );
  }
}
