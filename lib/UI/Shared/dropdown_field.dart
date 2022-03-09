//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDown extends StatefulWidget {
  //final void Function(dynamic)? onChanged;
  String? value;
  List<DropdownMenuItem<String>>? items;
  final Color? color;
  final Color? fillColor;
  void Function(Object?)? onChanged;
  String? location;
  final TextStyle? style;

  DropDown(
      {Key? key,
      this.items,
      this.value,
      this.location,
      this.color,
      this.fillColor,
      this.onChanged,
      this.style})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<dynamic> newList = [];
  List? demoProfiles = [];

  @override
  Widget build(BuildContext context) {
    //Rfetct();

    return FutureBuilder(
        future: fetct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //print(newList);
            return DropdownButtonHideUnderline(
              child: DropdownButton(
                style: widget.style,
                value: widget.value,
                items: newList
                    .map(
                        (val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: widget.onChanged,
                // (value) {
                //   setState(
                //     () {
                //       widget.value = value as String?;
                //       print(value);
                //     },
                //   );
                // },
                hint: const Text('Resident'), //onChanged: onChanged
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  fetct() async {
    if (widget.location == 'Mainland') {
      await FirebaseFirestore.instance
          .collection('States')
          .doc('ukOBOkAZ6XyvcXfOeeGf')
          .get()
          .then((ds) {
        newList = ds.data()!['Lagos'][1][widget.location] as List<dynamic>;
        print(newList);
      });
    } else if (widget.location == 'Island') {
      await FirebaseFirestore.instance
          .collection('States')
          .doc('ukOBOkAZ6XyvcXfOeeGf')
          .get()
          .then((ds) {
        newList = ds.data()!['Lagos'][0][widget.location] as List<dynamic>;
        print(newList);
      });
    }
  }
}

//import 'dart:html';

class DropDownLocation extends StatefulWidget {
  //final void Function(dynamic)? onChanged;
  String? value;
  List<DropdownMenuItem<String>>? items;
  final Color? color;
  final Color? fillColor;
  void Function(Object?)? onChanged;
  final TextStyle? style;

  DropDownLocation(
      {Key? key,
      this.items,
      this.value,
      this.onChanged,
      this.color,
      this.fillColor,
      this.style})
      : super(key: key);

  @override
  State<DropDownLocation> createState() => _DropDownStateLocation();
}

class _DropDownStateLocation extends State<DropDownLocation> {
  List<dynamic> newList = [];
  List? demoProfiles = [];

  @override
  Widget build(BuildContext context) {
    //Rfetct();

    return FutureBuilder(
        future: fetct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(newList);
            return DropdownButtonHideUnderline(
              child: DropdownButton(
                style: widget.style,
                value: widget.value,
                items: newList
                    .map(
                        (val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: widget.onChanged,
                hint: const Text('Area'), //onChanged: onChanged
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  fetct() async {
    await FirebaseFirestore.instance
        .collection('Areas')
        .doc('qkuRU2oKw0cK6YWHAnbT')
        .get()
        .then((ds) {
      newList = ds.data()!['Lagos'] as List<dynamic>;
      print(newList);
    });
  }
}
