import 'package:birddie/Services/services.dart';
import 'package:birddie/UI/Dashboard/Account/upgrade_account_screen.dart';
import 'package:birddie/UI/Dashboard/Events/events.dart';
import 'package:birddie/UI/InformationScreens/data_screens.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  var service = FirebaseService();
  //FirebaseAuth auth = FirebaseAuth.instance;
  var uid;
  var imgUrl;
  var user;

  @override
  void initState() {
    user = fetchData();
    // TODO: implement initState
    super.initState();
  }

  Future<DocumentSnapshot<Object?>> fetchData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var uid = auth.currentUser!.uid;
    return FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: user,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          print(imgUrl);
          if (snapshot.data == null) {
            return Drawer(
              backgroundColor: const Color.fromRGBO(252, 197, 197, 1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 147,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromRGBO(253, 253, 253, 1),
                              width: 3)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          profile,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'User Profile not Save',
                      style: GoogleFonts.asap(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(58, 58, 58, 1)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 32,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(const InfoScreen());
                          //getNextPage();
                        },
                        child: Text('Profile',
                            style: GoogleFonts.asap(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 32,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          //getNextPage();
                          Get.to(const UpgradeAccounts());
                        },
                        child: Text('Subscription',
                            style: GoogleFonts.asap(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 32,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(const Events());
                          //getNextPage();
                        },
                        child: Text('Events',
                            style: GoogleFonts.asap(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 45,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          service.signOut();
                          //getNextPage();
                        },
                        child: Text('LogOut',
                            style: GoogleFonts.asap(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
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
          } else if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            imgUrl = data['imagePath'];
            print(imgUrl);
            return Drawer(
              backgroundColor: const Color.fromRGBO(252, 197, 197, 1),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 147,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromRGBO(253, 253, 253, 1),
                              width: 3)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            data['imagePath'],
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data['name'],
                      style: GoogleFonts.asap(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(58, 58, 58, 1)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 32,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(const InfoScreen());
                          //getNextPage();
                        },
                        child: Text('Profile',
                            style: GoogleFonts.asap(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 32,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          //getNextPage();
                          Get.to(const UpgradeAccounts());
                        },
                        child: Text('Subscription',
                            style: GoogleFonts.asap(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 32,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(const Events());
                          //getNextPage();
                        },
                        child: Text('Events',
                            style: GoogleFonts.asap(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 45,
                      width: 181,
                      child: ElevatedButton(
                        onPressed: () async {
                          service.signOut();
                          //getNextPage();
                        },
                        child: Text('LogOut',
                            style: GoogleFonts.asap(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(255, 255, 255, 1))),
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
          } else if (snapshot.connectionState == ConnectionState.waiting ||
              imgUrl == null) {
            return const Drawer(
              backgroundColor: Color.fromRGBO(252, 197, 197, 1),
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Drawer(
              backgroundColor: Color.fromRGBO(252, 197, 197, 1),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
