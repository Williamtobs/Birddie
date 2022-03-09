import 'package:birddie/UI/Dashboard/Events/event_screens.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/tickets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'match_details_screen.dart';

class ReviewingMatch extends StatelessWidget {
  final String category;
  ReviewingMatch({Key? key, required this.category}) : super(key: key);

  var uid;
  FirebaseAuth auth = FirebaseAuth.instance;

  String? review;

  void reviewTime() {
    if (category == 'Russian Roulette') {
      review =
          'You have been added to the queue, you will be notified once you have a match';
    } else if (category == 'Sponsored Roulette') {
      review =
          'You have been added to the queue, you will be match within 24hrs, '
          'you will be notified once you have a match, (this is sponsored and recorded)';
    } else if (category == 'Sponsored Roulette') {
      review =
          'You have been added to the queue, your will be match within the next 10mins, '
          'you will be notified once you have a match,';
    }
  }

  @override
  Widget build(BuildContext context) {
    reviewTime();
    uid = auth.currentUser!.uid;
    var matchDetails =
        FirebaseFirestore.instance.collection(category).doc(uid).get();
    return FutureBuilder<DocumentSnapshot>(
        future: matchDetails,
        builder: (context, snapshot) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data);
          return Scaffold(
            backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
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
              padding: const EdgeInsets.all(15.0),
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
                                    DocumentSnapshot<Map<String, dynamic>>
                                        list = snapshot.data.docs[index];
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
                                        price_slang:
                                            list.data()!['price_slang'],
                                        slots_book: list.data()!['slot_book'],
                                      ),
                                    );
                                  }),
                            );
                          }
                        }),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Under review...',
                      style: GoogleFonts.asap(
                        fontSize: 36,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(58, 89, 136, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: 278,
                      child: Text(
                        '$review',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.asap(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(58, 89, 136, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Get.to(const MatchDetails());
                    },
                    child: SizedBox(
                      height: 217,
                      width: 358,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 332,
                              height: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  color: Color.fromRGBO(255, 84, 84, 1)),
                              child: Row(
                                children: [
                                  Text(
                                    category,
                                    style: GoogleFonts.asap(
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          253, 253, 253, 1),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '__  __  ',
                                    style: GoogleFonts.asap(
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                  Text(
                                    ' | ',
                                    style: GoogleFonts.asap(
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          253, 253, 253, 1),
                                    ),
                                  ),
                                  Text(
                                    ' --:--pm ',
                                    style: GoogleFonts.asap(
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(71, 71, 71, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 358,
                              height: 183,
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11.0)),
                                  color: Color.fromRGBO(250, 160, 160, 1)),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your ideal date location: ',
                                        style: GoogleFonts.asap(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              58, 58, 58, 1),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        data['date_location'],
                                        style: GoogleFonts.asap(
                                          fontSize: 26,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              58, 58, 58, 1),
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      SizedBox(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    color: Color.fromRGBO(
                                                        216, 211, 211, 1),
                                                  ),
                                                  child: Text(
                                                    'Ikeja',
                                                    style: GoogleFonts.asap(
                                                      fontSize: 10,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
                                                              58, 58, 58, 1),
                                                    ),
                                                  )),
                                              const SizedBox(width: 7),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    color: Color.fromRGBO(
                                                        216, 211, 211, 1),
                                                  ),
                                                  child: Text(
                                                    'Surulere',
                                                    style: GoogleFonts.asap(
                                                      fontSize: 10,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
                                                              58, 58, 58, 1),
                                                    ),
                                                  )),
                                              const SizedBox(width: 7),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                30)),
                                                    color: Color.fromRGBO(
                                                        216, 211, 211, 1),
                                                  ),
                                                  child: Text(
                                                    'Yaba',
                                                    style: GoogleFonts.asap(
                                                      fontSize: 10,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          const Color.fromRGBO(
                                                              58, 58, 58, 1),
                                                    ),
                                                  )),
                                            ]),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                          padding: const EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            color: Color.fromRGBO(
                                                216, 211, 211, 1),
                                          ),
                                          child: Text(
                                            data['date_setup'],
                                            style: GoogleFonts.asap(
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  58, 58, 58, 1),
                                            ),
                                          )),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Age Range',
                                        style: GoogleFonts.asap(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              58, 58, 58, 1),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(children: [
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              color: Color.fromRGBO(
                                                  216, 211, 211, 1),
                                            ),
                                            child: Text(
                                              data['age_from'].toString(),
                                              style: GoogleFonts.asap(
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    58, 58, 58, 1),
                                              ),
                                            )),
                                        const SizedBox(width: 7),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              color: Color.fromRGBO(
                                                  216, 211, 211, 1),
                                            ),
                                            child: Text(
                                              data['age_to'].toString(),
                                              style: GoogleFonts.asap(
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    58, 58, 58, 1),
                                              ),
                                            )),
                                      ]),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 74,
                                    height: 86,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0)),
                                        color: Color.fromRGBO(255, 84, 84, 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        children: [
                                          Text('09',
                                              style: GoogleFonts.asap(
                                                fontSize: 52,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              )),
                                          const SizedBox(height: 2),
                                          Text('Left\t Hours',
                                              style: GoogleFonts.asap(
                                                fontSize: 7,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    255, 255, 255, 1),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
