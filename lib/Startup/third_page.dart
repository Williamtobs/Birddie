import 'package:birddie/Constant/validators.dart';
import 'package:birddie/Services/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  //TextEditingController birthController = TextEditingController();
  TextEditingController workController = TextEditingController();
  TextEditingController name = TextEditingController();
  String birthController = 'DATE OF BIRDTH';
  String? age;

  var setup = FirebaseService();
  var gender = 'Male';

  getNextPage() {
    if ((_formKey.currentState!.validate()) && terms == true) {
      saveDetails();
      //Get.to(const Inf
      //oScreen());
    } else if (!terms) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Accept the terms and condition to proceed'),
        backgroundColor: Colors.red.shade300,
      ));
      return;
    }
  }

  //Toggle button
  List<bool> isSelected = [true, false];

  //terms and condition radio
  bool terms = false;
  var val = 'terms';

  //permission radio
  bool pem = false;
  var val2 = 'permission';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(third),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(235, 18, 18, 1),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 70.0,
                        ),
                        child: Image.asset(
                          logo,
                          width: 116,
                          height: 114,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'I Am',
                      style: GoogleFonts.asap(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        //width: 343,
                        height: 43,
                        //alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 84, 84, 1),
                              width: 1,
                            )),
                        child: ToggleButtons(
                          //color: const Color.fromRGBO(132, 132, 132, 1),
                          fillColor: Colors.transparent,
                          //selectedColor: const Color.fromRGBO(255, 238, 84, 1),
                          borderColor: Colors.transparent,
                          selectedBorderColor: Colors.transparent,
                          //borderRadius: const BorderRadius.all(Radius.circular(0)),
                          children: [
                            isSelected[0]
                                ? Container(
                                    width: 176,
                                    height: 43,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 84, 84, 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(35)),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              255, 84, 84, 1),
                                          width: 2,
                                        )),
                                    child: Text(
                                      'MALE',
                                      style: GoogleFonts.asap(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              255, 238, 84, 1)),
                                    ),
                                  )
                                : Container(
                                    width: 160,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'MALE',
                                      style: GoogleFonts.asap(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              132, 132, 132, 1)),
                                    ),
                                  ),
                            isSelected[1]
                                ? Container(
                                    width: 176,
                                    height: 43,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            255, 84, 84, 1),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              255, 84, 84, 1),
                                          width: 2,
                                        )),
                                    child: Text(
                                      'FEMALE',
                                      style: GoogleFonts.asap(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              255, 238, 84, 1)),
                                    ),
                                  )
                                : Container(
                                    width: 160,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'FEMALE',
                                      style: GoogleFonts.asap(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              132, 132, 132, 1)),
                                    ),
                                  ),
                          ],
                          isSelected: isSelected,
                          onPressed: (int index) {
                            setState(() {
                              for (int indexBtn = 0;
                                  indexBtn < isSelected.length;
                                  indexBtn++) {
                                if (indexBtn == index) {
                                  isSelected[indexBtn] = !isSelected[indexBtn];
                                  if (isSelected[indexBtn] == isSelected[0]) {
                                    gender = 'Male';
                                  } else if (isSelected[indexBtn] ==
                                      isSelected[1]) {
                                    gender = 'Female';
                                  }
                                } else {
                                  isSelected[indexBtn] = false;
                                }
                              }
                            });
                          },
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 270,
                      height: 43,
                      child: TextFields(
                        hintText: 'NAME',
                        fillColor: const Color.fromRGBO(216, 211, 211, 1),
                        style: GoogleFonts.asap(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1)),
                        validate: validateTextField,
                        controller: name,
                        inputType: TextInputType.text,
                        color: const Color.fromRGBO(255, 84, 84, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        DatePicker.showDatePicker(context,
                            theme: const DatePickerTheme(
                              cancelStyle : TextStyle(color: Color.fromRGBO(255, 84, 84, 1), fontSize: 14),
                              doneStyle: TextStyle(color: Color.fromRGBO(255, 84, 84, 1), fontSize: 14),
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(1990, 1, 1),
                            maxTime: DateTime(2005, 12, 31), onConfirm: (date) {
                              print('confirm $date');
                              birthController = '${date.year} - ${date.month} - ${date.day}';
                              setState(() {
                                age = '${date.year} - ${2022}';
                              });
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        width: 270,
                        height: 43,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                          color: const Color.fromRGBO(216, 211, 211, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(255, 84, 84, 1),
                            width: 1,
                          )
                        ),
                        child: Text(birthController,
                          style: GoogleFonts.asap(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1)),),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 270,
                      height: 43,
                      child: TextFields(
                        hintText: 'OCCUPATION',
                        validate: validateTextField,
                        fillColor: const Color.fromRGBO(216, 211, 211, 1),
                        style: GoogleFonts.asap(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1)),
                        controller: workController,
                        inputType: TextInputType.text,
                        color: const Color.fromRGBO(255, 84, 84, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: terms,
                            fillColor: MaterialStateProperty.all(
                                const Color.fromRGBO(255, 238, 84, 1)),
                            checkColor: const Color.fromRGBO(255, 84, 84, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onChanged: (value) {
                              setState(() {
                                terms = value!;
                              });
                            }),
                        Text('I Accept The Terms & Conditions',
                            style: GoogleFonts.asap(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: pem,
                            fillColor: MaterialStateProperty.all(
                                const Color.fromRGBO(255, 238, 84, 1)),
                            checkColor: const Color.fromRGBO(255, 84, 84, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onChanged: (value) {
                              setState(() {
                                pem = value!;
                              });
                            }),
                        SizedBox(
                          width: 227,
                          child: Text(
                              'I Give Birddie Permission To Use My '
                              'Images For Any Birddie Related Promotions '
                              'Or Content.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.asap(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 48,
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () {
                          getNextPage();
                        },
                        child: Text('SIGNUP',
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  saveDetails() async {
    setup.userSetup(birthController, workController.text.trim(),
        name.text.trim(), age!, gender, pem,);
  }
}
