import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.controller,
    this.preffix,
    this.hintText,
    this.inputType = TextInputType.text,
  }) : super(key: key);
  final TextEditingController? controller;
  final Widget? preffix;
  final String? hintText;
  TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        //keyboardType: TextInputType.number,
        keyboardType: inputType,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.digitsOnly,
        // ],
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: preffix,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 69, 67, 67))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red))),
      ),
    );
  }
}
