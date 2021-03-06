import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFields extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextStyle? style;
  final Color? color;
  final String? initialValue;
  final Color? fillColor;
  final bool? read;
  final Function? functionValidate;
  final String? Function(String?)? validate;

  const TextFields(
      {Key? key,
      this.hintText,
      this.controller,
      this.inputType,
      this.style,
      required this.color,
      this.fillColor,
      this.functionValidate,
      this.validate,
      this.initialValue,
      this.read})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: read ?? false,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: inputType,
        validator: validate,
        initialValue: initialValue,
        style: style,
        decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: GoogleFonts.asap(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(71, 71, 71, 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: color!,
                  width: 1,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: color!,
                  width: 1,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  color: color!,
                  width: 1,
                ))));
  }
}
