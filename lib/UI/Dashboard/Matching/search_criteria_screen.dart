import 'package:birddie/UI/Dashboard/Matching/search_match.dart';
import 'package:birddie/UI/Shared/dropdown_field.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'matching.dart';

class SearchCriteria extends StatefulWidget {
  final String? title;
  final String? category;
  SearchCriteria({Key? key, this.title, this.category}) : super(key: key);

  @override
  State<SearchCriteria> createState() => _SearchCriteriaState();
}

class _SearchCriteriaState extends State<SearchCriteria> {
  TextEditingController ageFrom = TextEditingController();
  TextEditingController ageTo = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController dateSetup = TextEditingController();
  TextEditingController dateFrom = TextEditingController();
  TextEditingController dateTo = TextEditingController();
  TextEditingController timeFrom = TextEditingController();
  TextEditingController timeTo = TextEditingController();
  TextEditingController spending = TextEditingController();

  String? value;
  String? areaValue;

  @override
  void initState() {
    super.initState();
    state = TextEditingController(text: 'Lagos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(34),
              bottomRight: Radius.circular(34)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34),
                bottomRight: Radius.circular(34)),
            image: DecorationImage(
              image: AssetImage(appbar),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(34),
                      bottomRight: Radius.circular(34)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 84, 84, 1),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ))),
        ),
        title: Text('Match Filter ${widget.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 168,
                child: Text(
                  'Please, complete all fields for a '
                  'more accurate matching',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.asap(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 500,
                  width: 309,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 155, 155, 1),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age Range',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 181,
                          height: 23,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 33,
                                height: 16,
                                child: TextField(
                                  controller: ageFrom,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.asap(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.asap(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 84, 84, 1),
                                ),
                              ),
                              SizedBox(
                                width: 33,
                                height: 16,
                                child: TextField(
                                  controller: ageTo,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.asap(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'State',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 181,
                          height: 27,
                          child: TextFields(
                            controller: state,
                            //initialValue: 'Lagos',
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 84, 84, 1),
                            ),
                            color: const Color.fromRGBO(255, 84, 84, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Preferred date location',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 181,
                          height: 27,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                                width: 1,
                              )),
                          child: DropDownLocation(
                            onChanged: (value) {
                              setState(
                                () {
                                  areaValue = value as String?;
                                  print(value);
                                },
                              );
                            },
                            style: GoogleFonts.asap(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 84, 84, 1),
                            ),
                            value: areaValue,
                            //controller: controller,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Preferred date area',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 181,
                          height: 27,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                                width: 1,
                              )),
                          child: DropDown(
                            location: areaValue,
                            onChanged: (value) {
                              setState(
                                () {
                                  this.value = value as String;
                                  //print(value);
                                },
                              );
                            },
                            style: GoogleFonts.asap(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 84, 84, 1),
                            ),
                            value: value,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Preferred date Setup',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 181,
                          height: 27,
                          child: TextFields(
                            controller: dateSetup,
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 84, 84, 1),
                            ),
                            color: const Color.fromRGBO(255, 84, 84, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Date range',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 181,
                          height: 23,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 33,
                                height: 16,
                                child: TextField(
                                  controller: dateFrom,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.asap(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.asap(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 84, 84, 1),
                                ),
                              ),
                              SizedBox(
                                width: 33,
                                height: 16,
                                child: TextField(
                                  controller: dateTo,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.asap(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Time range',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 181,
                          height: 23,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 33,
                                height: 16,
                                child: TextField(
                                  controller: timeFrom,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.asap(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.asap(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 84, 84, 1),
                                ),
                              ),
                              SizedBox(
                                width: 33,
                                height: 16,
                                child: TextField(
                                  controller: timeTo,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: GoogleFonts.asap(
                                    fontSize: 15,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Spending Guage',
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 181,
                          height: 27,
                          child: TextFields(
                            fillColor: const Color.fromRGBO(239, 239, 239, 1),
                            controller: spending,
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 84, 84, 1),
                            ),
                            color: const Color.fromRGBO(255, 84, 84, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 28,
                          width: 138,
                          child: ElevatedButton(
                            onPressed: () {
                              addDetails(widget.category!);
                            },
                            child: Text('MATCH ME',
                                style: GoogleFonts.asap(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromRGBO(255, 238, 84, 1))),
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(255, 84, 84, 1),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  Future addDetails(String category) async {
    var uid = auth.currentUser?.uid;
    CollectionReference users = FirebaseFirestore.instance.collection(category);
    var doc = users.doc(uid);
    await doc.set({
      'age_from': int.parse(ageFrom.text.trim()),
      'age_to': int.parse(ageTo.text.trim()),
      'state': state.text.trim(),
      'date_location': areaValue,
      'date_area': value,
      'date_setup': dateSetup.text.trim(),
      'date': '${dateFrom.text.trim()} - ${dateTo.text.trim()}',
      'time': '${timeFrom.text.trim()} - ${timeTo.text.trim()}',
      "spending_guage": spending.text.trim(),
    }).then((value) {
      print("Match form Added");
      Get.to(Search(
        category: category,
      ));
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
