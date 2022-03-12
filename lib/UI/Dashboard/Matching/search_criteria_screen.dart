import 'package:birddie/UI/Dashboard/Matching/search_match.dart';
import 'package:birddie/UI/Shared/dropdown_field.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:smart_calendar/controller/smart_calendar_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Shared/time_dropdown.dart';

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
  TextEditingController dateFrom = TextEditingController();
  TextEditingController dateTo = TextEditingController();
  String? state;
  TextEditingController dateSetup = TextEditingController();
  String? timeFrom;
  String? timeTo;
  TextEditingController spending = TextEditingController();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  //CalendarController _calendarController = new CalendarController();
  DateTime focusedDay = DateTime.now();
  DateTime? firstDay;
  DateTime? lastDay;
  DateTime? _selectedDay1;
  DateTime? _selectedDay2;

  calender(BuildContext context, DateTime? _selectedDay){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: TableCalendar(
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            this.focusedDay = focusedDay;
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              // Call `setState()` when updating the selected day
                _selectedDay = selectedDay;
                this.focusedDay = focusedDay;
            }
          },
          selectedDayPredicate: (day){
            return isSameDay(_selectedDay, day);
          },
          calendarFormat: _calendarFormat,
          //calendarController: _calendarController,
           focusedDay: focusedDay, firstDay: DateTime.utc(2010,10,20), lastDay: DateTime.utc(2040,10,20),
        ),
        actions: [
          GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Text('Close'))
        ],
      );
    });
  }

  String? value;
  String? areaValue;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('Location')
        .doc('Axf4eRaHWs4obB6IEwnI')
        .get();
    calender;
    //state = TextEditingController(text: 'Lagos');
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
                          width: 200,
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
                                width: 40,
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
                                width: 40,
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
                        Container(
                          width: 200,
                          height: 27,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                                width: 1,
                              )),
                          child: DropDownAreaSelect(
                            //iden: iden,
                            //color: const Color.fromRGBO(216, 211, 211, 1),
                            //items: list!,
                            onChanged: (value) {
                              setState(
                                    () {
                                  state = value as String?;
                                  print(value);
                                },
                              );
                            },
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(71, 71, 71, 1)),
                            value: state,
                            //controller: controller,
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
                          width: 200,
                          height: 27,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                                width: 1,
                              )),
                          child: DropDownLocation(
                            //iden: iden,
                            location: state,
                            //color: const Color.fromRGBO(216, 211, 211, 1),
                            //items: list!,
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
                                color: const Color.fromRGBO(71, 71, 71, 1)),
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
                          width: 200,
                          height: 27,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(255, 84, 84, 1),
                                width: 1,
                              )),
                          child: DropDown(
                            location: areaValue,
                            location2: state,
                            onChanged: (value) {
                              setState(
                                    () {
                                  this.value = value as String;
                                },
                              );
                            },
                            value: value,
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(71, 71, 71, 1)),
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
                          width: 200,
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
                          width: 200,
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
                        //       GestureDetector(
                        //   onTap: (){
                        //     showDialog(
                        //         context: context, builder: (BuildContext context){
                        //           return calender(context, _selectedDay1);
                        //     }
                        //
                        //     );
                        // },
                        //         child:
                              SizedBox(
                                width: 38,
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
                              //),
                              //   SizedBox(
                              //     width: 33,
                              //     height: 16,
                              //     child: _selectedDay1 == null ?
                              //     Text(
                              //         "${_selectedDay1?.day.toString()} - ${_selectedDay1?.month.toString()}" , style: GoogleFonts.asap(
                              //       fontSize: 15,
                              //       fontStyle: FontStyle.normal,
                              //       fontWeight: FontWeight.w700,
                              //       color: const Color.fromRGBO(255, 84, 84, 1),
                              //     )) : Text('Empty')
                              //   ),
                              // ),
                              Text(
                                '|',
                                style: GoogleFonts.asap(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(255, 84, 84, 1),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: (){
                              //     showDialog(
                              //         context: context, builder: (BuildContext context){
                              //       return calender(context, _selectedDay2);
                              //     }
                              //
                              //     );
                              //   },
                              //   child:
                              SizedBox(
                                width: 38,
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
                              ),
                              //   SizedBox(
                              //     width: 33,
                              //     height: 16,
                              //     child: _selectedDay2 == null ?
                              //     Text(
                              //         "${_selectedDay2?.day.toString()} - ${_selectedDay2?.month.toString()}" ?? '', style: GoogleFonts.asap(
                              //       fontSize: 15,
                              //       fontStyle: FontStyle.normal,
                              //       fontWeight: FontWeight.w700,
                              //       color: const Color.fromRGBO(255, 84, 84, 1),
                              //     )):
                              //         Text('Empty')
                              //   ),
                              //)
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
                          width: 200,
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
                              Expanded(
                                child: Container(
                                  width: 45,
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: DropDownTime(
                                    style: GoogleFonts.asap(
                                      fontSize: 15,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(255, 84, 84, 1),
                                    ),
                                    value: timeFrom,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          timeFrom = value as String;
                                        },
                                      );
                                    },
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
                              Expanded(
                                child: Container(
                                  width: 45,
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: DropDownTime(
                                    style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(255, 84, 84, 1),
                                        ),
                                    value: timeTo,
                                    onChanged: (value) {
                                      setState(
                                            () {
                                              timeTo = value as String;
                                        },
                                      );
                                    },
                                  ),
                                  // TextField(
                                  //   controller: timeTo,
                                  //   textAlign: TextAlign.center,
                                  //   keyboardType: TextInputType.number,
                                  //   style: GoogleFonts.asap(
                                  //     fontSize: 15,
                                  //     fontStyle: FontStyle.normal,
                                  //     fontWeight: FontWeight.w700,
                                  //     color: const Color.fromRGBO(255, 84, 84, 1),
                                  //   ),
                                  //   decoration: const InputDecoration(
                                  //     border: InputBorder.none,
                                  //     focusedBorder: InputBorder.none,
                                  //     enabledBorder: InputBorder.none,
                                  //     errorBorder: InputBorder.none,
                                  //     disabledBorder: InputBorder.none,
                                  //   ),
                                  // ),
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
                          width: 200,
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
      'state': state,
      'date_location': areaValue,
      'date_area': value,
      'date_setup': dateSetup.text.trim(),
      'date': '${dateFrom.text.trim()} - ${dateTo.text.trim()}',
      'time': '$timeFrom - $timeTo',
      "spending_guage": spending.text.trim(),
    }).then((value) {
      print("Match form Added");
      Get.to(
          Search(
        category: category,
      ));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to add use case: $error"),
        backgroundColor: Colors.red.shade300,
      ));
      print("Failed to add user: $error");
    });
  }
}
