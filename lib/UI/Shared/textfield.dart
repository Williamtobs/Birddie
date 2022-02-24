import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFields extends StatelessWidget{
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final TextStyle? style;
  final Color? color;
  final Color? fillColor;

  const TextFields({Key? key, this.hintText, this.controller, this.inputType, this.style, required this.color, this.fillColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: inputType,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: GoogleFonts.asap(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(71, 71, 71, 1)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color:  color!,
              width: 1,
            )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color:  color!,
              width: 1,
            )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color:  color!,
              width: 1,
            )
        )
      )
    );
  }

}