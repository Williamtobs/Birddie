import 'package:birddie/UI/Dashboard/Matching/matching.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/tickets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Chats/chats_screen.dart';
import 'Account/upgrade_account_screen.dart';
import 'Events/event_screens.dart';
import 'Matching/search_criteria_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(Chats());
          },
          icon: const Icon(
            Icons.menu_outlined,
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Up coming events',
                style: GoogleFonts.asap(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Events")
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Text("No available Ticket");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        width: 315,
                        height: 140,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctxt, int index) {
                              DocumentSnapshot<Map<String, dynamic>> list =
                                  snapshot.data.docs[index];
                              print(list.id);
                              print(list.data()!['name']);
                              return GestureDetector(
                                onTap: () {
                                  Get.to(EventScreen(
                                    docId: list.id,
                                  ));
                                },
                                child: Tickets(
                                  name: list.data()!['name'],
                                  location: list.data()!['location'],
                                  date: list.data()!['date'],
                                  time: list.data()!['time'],
                                  price_slang: list.data()!['price_slang'],
                                  slots_book: list.data()!['slot_book'],
                                ),
                              );
                            }),
                      );
                    }
                  }),
            ),
            const SizedBox(height: 30),
            Text('Please choose below',
                style: GoogleFonts.asap(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
            const SizedBox(height: 20),
            SizedBox(
              width: 181,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(SearchCriteria(
                    title: 'Russian Roulette',
                    category: 'Russian Roulette',
                  ));
                },
                child: Text(
                  'Russian Roulette',
                  style: GoogleFonts.asap(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 84, 84, 1)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(239, 239, 239, 1),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color.fromRGBO(255, 84, 84, 1),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 181,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(SearchCriteria(
                    title: 'Sponsored Roulette',
                    category: 'Sponsored Roulette',
                  ));
                },
                child: Text(
                  'Sponsored Roulette',
                  style: GoogleFonts.asap(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 84, 84, 1)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(239, 239, 239, 1),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color.fromRGBO(255, 84, 84, 1),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(color: Color.fromRGBO(255, 84, 84, 0.35)),
            const SizedBox(height: 10),
            Text('PREMIUM DATES',
                style: GoogleFonts.asap(
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
            Text(
                'These options let you choose a '
                'date from a list',
                style: GoogleFonts.asap(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
            const SizedBox(height: 10),
            SizedBox(
              width: 181,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(SearchCriteria(
                    title: 'Instant Roulette',
                    category: 'Instant Roulette',
                  ));
                  //Get.to(const UpgradeAccounts());
                },
                child: Text(
                  'Instant Roulette',
                  style: GoogleFonts.asap(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 84, 84, 1)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(239, 239, 239, 1),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color.fromRGBO(255, 84, 84, 1),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 181,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(const Matching());
                },
                child: Text(
                  'Match Metrix',
                  style: GoogleFonts.asap(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 84, 84, 1)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(239, 239, 239, 1),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(
                        color: Color.fromRGBO(255, 84, 84, 1),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
