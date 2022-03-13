import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/time.dart';

class DropDownTime extends StatelessWidget{
  DropDownTime({Key? key, this.onChanged, this.value, this.style}) : super(key: key);

  void Function(Object?)? onChanged;
  String? value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          //itemHeight: ,
          //borderRadius: BorderRadius.zero,
          value: value,
          icon: const Visibility( visible: false, child: Icon(Icons.arrow_downward)),
          items: Time.time.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged
        ),
      ),
    );
  }

}