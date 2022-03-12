import 'dart:io';

import 'package:birddie/Services/services.dart';
import 'package:birddie/UI/Dashboard/dashboard_screen.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  String? video;
  var _state = false;
  var uid;
  var vidUrl;
  var url;
  var setup = FirebaseService();
  var service = FirebaseService();
  String? stateOfOrigin, occupation, region, area, lookingFor, alcohol, smoke;

  FirebaseAuth auth = FirebaseAuth.instance;
  final picker = ImagePicker();
  String? videoPath;
  File? _video;

  DocumentReference texts = FirebaseFirestore.instance.collection('ScreensInfo').doc('1MNqJtxHyObzoRs1NIm7');
  String? text1;
  //String? text2;

  @override
  initState() {
    super.initState;
    texts.get().then((DocumentSnapshot snapshot){
      text1 = snapshot['text1'];
    });
    loadVideo();
  }

  Future loadVideo() async {
    _controller = await VideoPlayerController.network(
      vidUrl,
    );
    _initializeVideoPlayerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller!.dispose();
    super.dispose();
  }

  bool videoReplace = false;

  Future getVideo() async {
    var pickedFile = (await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 60)));
    //pickedFile.then((value) => null)
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
        videoReplace = true;
        _controller = VideoPlayerController.file(_video!);
        _initializeVideoPlayerFuture = _controller!.initialize();
        _controller!.setLooping(true);
      } else {
        print('No Video selected.');
      }
    });
    videoPath = await setup.uploadVideo(_video!);
    print(videoPath);
  }

  @override
  Widget build(BuildContext context) {
    uid = auth.currentUser!.uid;
    var users = FirebaseFirestore.instance.collection('users').doc(uid).get();
    return FutureBuilder<DocumentSnapshot>(
        future: users,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            loadVideo();
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            vidUrl = data['videoPath'];
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
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
                body: SingleChildScrollView(
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
                              SizedBox(
                                  height: AppBar().preferredSize.height + 20),
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
                                text1!,
                                style: GoogleFonts.asap(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(58, 89, 136, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                  width: 210,
                                  height: 161,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            255, 84, 84, 1),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(14))),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 210,
                                        height: 161,
                                        child: _controller != null
                                            ? FutureBuilder(
                                                future:
                                                    _initializeVideoPlayerFuture,
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: AspectRatio(
                                                        aspectRatio:
                                                            _controller!.value
                                                                .aspectRatio,
                                                        // Use the VideoPlayer widget to display the video.
                                                        child: VideoPlayer(
                                                            _controller!),
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
                                            : FutureBuilder(
                                                future: loadVideo(),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          // If the video is playing, pause it.
                                                          if (_controller!.value
                                                              .isPlaying) {
                                                            _controller!
                                                                .pause();
                                                            _state = !_state;
                                                          } else {
                                                            // If the video is paused, play it.
                                                            _controller!.play();
                                                          }
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: AspectRatio(
                                                          aspectRatio:
                                                              _controller!.value
                                                                  .aspectRatio,
                                                          // Use the VideoPlayer widget to display the video.
                                                          child: VideoPlayer(
                                                              _controller!),
                                                        ),
                                                      ),
                                                    );
                                                  } else if (!snapshot
                                                      .hasData) {
                                                    // If the VideoPlayerController is still initializing, show a
                                                    // loading spinner.
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  } else {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                },
                                              ),
                                      ),
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Icon(
                                          Icons.verified,
                                          color: Colors.blue,
                                          size: 28,
                                        ),
                                      ),
                                      _state
                                          ? const Align(
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons
                                                    .pause_circle_filled_outlined,
                                                color: Colors.red,
                                                size: 28,
                                              ),
                                            )
                                          : const Align(
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.play_circle,
                                                color: Colors.red,
                                                size: 28,
                                              ),
                                            )
                                    ],
                                  )),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 28,
                                width: 138,
                                child: ElevatedButton(
                                  onPressed: () {
                                    getVideo();
                                    //getNextPage();
                                  },
                                  child: Text('REPLACE VIDEO',
                                      style: GoogleFonts.asap(
                                          fontSize: 13,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(
                                              255, 238, 84, 1))),
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromRGBO(255, 84, 84, 1),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
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
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                    width: 152,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
                                    child: Text(
                                      data['occupation'],
                                      style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1)),
                                    )),
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
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                    width: 152,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
                                    child: Text(
                                      data['state']!,
                                      style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1)),
                                    )),
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
                                    'Region:',
                                    style: GoogleFonts.asap(
                                      fontSize: 10,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                    width: 152,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
                                    child: Text(
                                      data['area'],
                                      style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1)),
                                    )),
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
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Container(
                                    width: 152,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
                                    child: Text(
                                      data['location'],
                                      style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1)),
                                    )),
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
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 27,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: Color.fromRGBO(253, 253, 253, 1)),
                                child: Text(
                                  data['interest'],
                                  style: GoogleFonts.asap(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1)),
                                )),
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
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                    width: 152,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
                                    child: Text(
                                      data['drink'],
                                      style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1)),
                                    )),
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
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                    width: 152,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
                                    child: Text(
                                      data['smoke']!,
                                      style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1)),
                                    )),
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
                            onPressed: () {
                              _controller != null
                                  ? addDetails()
                                  : Get.to(const DashBoardScreen());
                            },
                            child: Text('SAVE',
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
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ));
          } else {
            return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                    child: CircularProgressIndicator(color: Colors.redAccent)));
          }
        });
  }

  Future addDetails() async {
    var uid = auth.currentUser?.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var doc = users.doc(uid);
    await doc.update({
      "video": _video.toString(),
      'videoPath': videoPath,
    }).then((value) {
      print("Video updated");
      Get.to(const DashBoardScreen());
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
