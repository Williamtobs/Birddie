import 'package:birddie/UI/InformationScreens/user_profile.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'dart:io';

import '../../Constant/validators.dart';
import '../../Services/services.dart';
import '../Shared/dropdown_field.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  bool imageUpload = false;

  //TextEditingController
  TextEditingController occupation = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController interest = TextEditingController();
  TextEditingController drink = TextEditingController();
  TextEditingController smoke = TextEditingController();
  //TextEditingController occupation = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var setup = FirebaseService();
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;

  getNextPage() {
    //if ((_formKey.currentState!.validate())) {
    addDetails();
    //Get.to(const InfoScreen());
    //}
  }

  File? _image;
  File? _video;
  String? value;
  String? areaValue;
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  String? videoPath;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   list = setup.fetchLocation(1);
    // });
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 161,
      maxWidth: 120,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setup.uploadImage(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getVideo() async {
    var pickedFile = (await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 60)));
    //pickedFile.then((value) => null)
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);

        //videoPath = 'videos/$_video';
        _controller = VideoPlayerController.file(_video!);
        _initializeVideoPlayerFuture = _controller?.initialize();
        _controller?.setLooping(true);
      } else {
        print('No Video selected.');
      }
    });
    videoPath = await setup.uploadVideo(_video!);
    print(videoPath);
  }

  @override
  Widget build(BuildContext context) {
    //addDetails();
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        title: Text(
          'Profile',
          style: GoogleFonts.asap(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(255, 238, 84, 1)),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10, left: 20, right: 10),
            child: Container(
              width: 148,
              height: 28,
              padding: const EdgeInsets.only(left: 8, top: 8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Color.fromRGBO(71, 71, 71, 1)),
              child: Text(
                'Premium : Monthly',
                style: GoogleFonts.asap(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(216, 211, 211, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(34),
                      bottomRight: Radius.circular(34)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppBar().preferredSize.height + 20),
                      Text(
                        'QUESTION',
                        style: GoogleFonts.asap(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(255, 84, 84, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'What Is Your Ultimate Goal In Life?',
                        style: GoogleFonts.asap(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(58, 89, 136, 1),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: _controller == null,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 38,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 122, 122, 0.26),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Text(
                              'Answer the question above in a 60 '
                              'seconds video and upload below',
                              style: GoogleFonts.asap(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(111, 111, 111, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: _controller == null,
                          child: const SizedBox(height: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              getVideo();
                            },
                            child: Container(
                              width: 210,
                              height: 161,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(255, 84, 84, 1),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14))),
                              child: _controller != null
                                  ? FutureBuilder(
                                      future: _initializeVideoPlayerFuture,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: AspectRatio(
                                              aspectRatio: _controller!
                                                  .value.aspectRatio,
                                              // Use the VideoPlayer widget to display the video.
                                              child: VideoPlayer(_controller!),
                                            ),
                                          );
                                        } else {
                                          // If the VideoPlayerController is still initializing, show a
                                          // loading spinner.
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add_outlined,
                                          size: 45,
                                          //
                                          color:
                                              Color.fromRGBO(196, 196, 196, 1),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'ADD VIDEO',
                                          style: GoogleFonts.asap(
                                            fontSize: 13,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromRGBO(
                                                255, 84, 84, 1),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Container(
                                width: 120,
                                height: 161,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(255, 84, 84, 1),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(14))),
                                child: _image == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add_outlined,
                                            size: 45,
                                            color: Color.fromRGBO(
                                                196, 196, 196, 1),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            'ADD A \nPROFILE \nPICTURE',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.asap(
                                              fontSize: 13,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  255, 84, 84, 1),
                                            ),
                                          )
                                        ],
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Image.file(
                                          _image!,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Visibility(
                          visible: _controller != null && _image != null,
                          child: SizedBox(
                            height: 28,
                            width: 172,
                            child: ElevatedButton(
                              onPressed: () {
                                //getNextPage();
                                showDialog(
                                    barrierColor: Colors.red.withOpacity(0.8),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return _showDialog(context);
                                    });
                              },
                              child: Text('VERIFY PICTURE/VIDEO',
                                  style: GoogleFonts.asap(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          255, 238, 84, 1))),
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(255, 84, 84, 1),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          )),
                      Visibility(
                          visible: _controller != null && _image != null,
                          child: const SizedBox(height: 10)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 15.0, right: 15),
                child: Text(
                  'ABOUT',
                  style: GoogleFonts.asap(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Occupation',
                            style: GoogleFonts.asap(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: 152,
                          height: 27,
                          child: TextFields(
                            validate: validateTextField,
                            controller: occupation,
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(71, 71, 71, 1)),
                            color: const Color.fromRGBO(216, 211, 211, 1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'State Of Residence:',
                            style: GoogleFonts.asap(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          width: 152,
                          height: 27,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(216, 211, 211, 1),
                                width: 1,
                              )),
                          child: DropDownLocation(
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
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Religion:',
                            style: GoogleFonts.asap(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: 152,
                          height: 27,
                          child: TextFields(
                            validate: validateTextField,
                            controller: region,
                            //controller: controller,
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(71, 71, 71, 1)),
                            color: const Color.fromRGBO(216, 211, 211, 1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Area',
                            style: GoogleFonts.asap(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          width: 152,
                          height: 27,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(
                                color: const Color.fromRGBO(216, 211, 211, 1),
                                width: 1,
                              )),
                          child: DropDown(
                            location: areaValue,
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
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text(
                        'I Am Looking For:',
                        style: GoogleFonts.asap(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(71, 71, 71, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 27,
                      child: TextFields(
                        validate: validateTextField,
                        controller: interest,
                        //controller: controller,
                        inputType: TextInputType.text,
                        style: GoogleFonts.asap(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1)),
                        color: const Color.fromRGBO(216, 211, 211, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15),
                child: Divider(
                  thickness: 1,
                  color: Color.fromRGBO(115, 108, 199, 0.46),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 15.0, right: 15),
                child: Text(
                  'SOCIAL HABITS',
                  style: GoogleFonts.asap(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(71, 71, 71, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Drink Alcohol:',
                            style: GoogleFonts.asap(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 152,
                          height: 27,
                          child: TextFields(
                            validate: validateTextField,
                            controller: drink,
                            //controller: controller,
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(71, 71, 71, 1)),
                            color: const Color.fromRGBO(216, 211, 211, 1),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            'Smoke:',
                            style: GoogleFonts.asap(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 152,
                          height: 27,
                          child: TextFields(
                            validate: validateTextField,
                            controller: smoke,
                            //controller: controller,
                            inputType: TextInputType.text,
                            style: GoogleFonts.asap(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(71, 71, 71, 1)),
                            color: const Color.fromRGBO(216, 211, 211, 1),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  height: 28,
                  width: 138,
                  child: ElevatedButton(
                    onPressed: getNextPage,
                    child: Text('SAVE',
                        style: GoogleFonts.asap(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(255, 238, 84, 1))),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(255, 84, 84, 1),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showDialog(BuildContext context) {
    print(value);
    print(areaValue);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27.0),
      ),
      elevation: 1,
      backgroundColor: const Color.fromRGBO(243, 238, 238, 1),
      child: SizedBox(
        height: 370,
        width: 306,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(warning, height: 100, width: 100),
            const SizedBox(height: 20),
            Text('Profile Picture & video',
                style: GoogleFonts.asap(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(58, 89, 136, 1))),
            const SizedBox(height: 20),
            Text('You failed verification.',
                style: GoogleFonts.asap(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 84, 84, 1))),
            Text(
                'Please, upload a clear picutre and video showing '
                'your face alone answering the '
                'question & try again',
                textAlign: TextAlign.center,
                style: GoogleFonts.asap(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(111, 111, 111, 1))),
            const SizedBox(height: 20),
            SizedBox(
              height: 45,
              width: 181,
              child: ElevatedButton(
                onPressed: () {
                  //getNextPage();
                },
                child: Text('CLOSE',
                    style: GoogleFonts.asap(
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 238, 84, 1))),
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
    );
  }

  Future addDetails() async {
    var uid = _auth.currentUser?.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var doc = users.doc(uid);
    await doc.update({
      'occupation': occupation.text.trim(),
      'area': areaValue,
      'religion': region.text.trim(),
      'location': value,
      'interest': interest.text.trim(),
      'drink': drink.text.trim(),
      'smoke': smoke.text.trim(),
      "video": _video.toString(),
      'videoPath': videoPath,
      'image': _image.toString()
    }).then((value) {
      print("User Added");
      Get.to(const UserProfile());
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
