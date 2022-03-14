import 'package:birddie/UI/Dashboard/Drawer/side_drawer.dart';
import 'package:birddie/UI/Dashboard/Events/event_screens.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/tickets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchDetails extends StatefulWidget {
  final String? category;
  const MatchDetails({Key? key, this.category}) : super(key: key);

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  var uid;
  var date = DateTime.now();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    uid = auth.currentUser!.uid;
    var matchDetails =
        FirebaseFirestore.instance.collection(widget.category!).doc(uid).get();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      drawer: SideDrawer(),
      appBar: AppBar(
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
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(backGround),
          fit: BoxFit.cover,
        )),
        child: Padding(
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
              Center(
                child: Text(
                  'Congratulations!',
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
                child: Text(
                  'You have been matched!',
                  style: GoogleFonts.asap(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(58, 89, 136, 1),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FutureBuilder<DocumentSnapshot>(
                  future: matchDetails,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      print(data);
                      return SizedBox(
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
                                      widget.category!,
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
                                      '${data['date']}  ',
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
                                      ' ${data['start_time']} ',
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
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11.0)),
                                    color: Color.fromRGBO(250, 160, 160, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5),
                                          Text(
                                            'Lounge 526',
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      alignment:
                                                          Alignment.center,
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
                                                        data['date_area'],
                                                        style: GoogleFonts.asap(
                                                          fontSize: 10,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              58, 58, 58, 1),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 4),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      alignment:
                                                          Alignment.center,
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
                                                        data['date_setup'],
                                                        style: GoogleFonts.asap(
                                                          fontSize: 10,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              58, 58, 58, 1),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 4),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      alignment:
                                                          Alignment.center,
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
                                                        'Pool',
                                                        style: GoogleFonts.asap(
                                                          fontSize: 10,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              58, 58, 58, 1),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 4),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      alignment:
                                                          Alignment.center,
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
                                                        'Food',
                                                        style: GoogleFonts.asap(
                                                          fontSize: 10,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              58, 58, 58, 1),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 4),
                                                  Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      alignment:
                                                          Alignment.center,
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
                                                        'Wifi',
                                                        style: GoogleFonts.asap(
                                                          fontSize: 10,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: const Color
                                                                  .fromRGBO(
                                                              58, 58, 58, 1),
                                                        ),
                                                      )),
                                                ]),
                                          ),
                                          const SizedBox(height: 6),
                                          Container(
                                            width: 120,
                                            child: Text(
                                              'to sort out',
                                              style: GoogleFonts.asap(
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    58, 58, 58, 1),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 75,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '2',
                                                  style: GoogleFonts.asap(
                                                    fontSize: 29,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Days',
                                                  style: GoogleFonts.asap(
                                                    fontSize: 7,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        58, 58, 58, 1),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                                color: Color.fromRGBO(
                                                    253, 253, 253, 1)),
                                            Row(
                                              children: [
                                                Text(
                                                  '09',
                                                  style: GoogleFonts.asap(
                                                    fontSize: 29,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Hours Left',
                                                  style: GoogleFonts.asap(
                                                    fontSize: 7,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        58, 58, 58, 1),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
