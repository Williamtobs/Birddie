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
  String? location2;
  final TextStyle? style;

  DropDown(
      {Key? key,
      this.items,
      this.value,
      this.location,
      this.location2,
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
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                style: widget.style,
                value: widget.value,
                items: newList
                    .map(
                        (val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: widget.onChanged,
                hint: const Text(
                  'Resident',
                  textAlign: TextAlign.center,
                ), //onChanged: onChanged
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  fetct() async {
    await FirebaseFirestore.instance
        .collection('Location')
        .doc('Axf4eRaHWs4obB6IEwnI')
        .get()
        .then((ds) {
      newList = ds.data()!['States'][widget.location2][widget.location]
          as List<dynamic>;
      print(newList);
    });
  }
}

class DropDownLocation extends StatefulWidget {
  //final void Function(dynamic)? onChanged;
  String? value;
  List<DropdownMenuItem<String>>? items;
  final Color? color;
  final Color? fillColor;
  void Function(Object?)? onChanged;
  final TextStyle? style;
  String? location;
  var iden;

  DropDownLocation(
      {Key? key,
      this.items,
      this.value,
      this.onChanged,
      this.location,
      this.color,
      this.fillColor,
      this.style})
      : super(key: key);

  @override
  State<DropDownLocation> createState() => _DropDownStateLocation();
}

class _DropDownStateLocation extends State<DropDownLocation> {
  List<dynamic> newList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(newList);
            return DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                style: widget.style,
                value: widget.value,
                items: newList
                    .map(
                        (val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: widget.onChanged,
                hint: const Text('Area',
                    textAlign: TextAlign.center), //onChanged: onChanged
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  fetct() async {
    await FirebaseFirestore.instance
        .collection('Location')
        .doc('Axf4eRaHWs4obB6IEwnI')
        .get()
        .then((ds) {
      newList = ds.data()!['States'][widget.location].keys.toList();
      //newList = ds.data()!['Lagos'] as List<dynamic>;
      print(newList);
    });
  }
}

//To work onnnnnnnn
class DropDownAreaSelect extends StatefulWidget {
  //final void Function(dynamic)? onChanged;
  String? value;
  final Color? color;
  final Color? fillColor;

  void Function(Object?)? onChanged;
  final TextStyle? style;

  DropDownAreaSelect(
      {Key? key,
      this.value,
      this.onChanged,
      this.color,
      this.fillColor,
      this.style})
      : super(key: key);

  @override
  State<DropDownAreaSelect> createState() => _DropDownAreaSelect();
}

class _DropDownAreaSelect extends State<DropDownAreaSelect> {
  List<dynamic> newList = [];

  @override
  void initState() {
    fetch();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(newList);
            return DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: const Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
                style: widget.style,
                value: widget.value,
                items: newList
                    .map(
                        (val) => DropdownMenuItem(value: val, child: Text(val)))
                    .toList(),
                onChanged: widget.onChanged,
                hint: const Text('State',
                    textAlign: TextAlign.center), //onChanged: onChanged
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  fetch() async {
    await FirebaseFirestore.instance
        .collection('Location')
        .doc('Axf4eRaHWs4obB6IEwnI')
        .get()
        .then((ds) {
      //print(ds.data()!['States']);
      newList = ds.data()!['States']?.keys.toList();
      print(newList);
    });
  }
}
