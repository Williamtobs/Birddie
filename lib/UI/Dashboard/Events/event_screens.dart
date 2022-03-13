import 'package:birddie/UI/Shared/images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class EventScreen extends StatefulWidget {
  final String docId;
  const EventScreen({Key? key, required this.docId}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  DocumentReference texts = FirebaseFirestore.instance.collection('ScreensInfo').doc('1MNqJtxHyObzoRs1NIm7');
  String? ticket_message;

  @override
  void initState() {
    texts.get().then((DocumentSnapshot snapshot) {
      ticket_message = snapshot['ticket_message'];
      //slot = snapshot['slot'];
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var events =
        FirebaseFirestore.instance.collection('Events').doc(widget.docId).get();
    return FutureBuilder<DocumentSnapshot>(
        future: events,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
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
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Events Details',
                            style: GoogleFonts.asap(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(71, 71, 71, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 553,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 155, 155, 1),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data['name'],
                                style: GoogleFonts.asap(
                                  fontSize: 21,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(71, 71, 71, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                ticket_message!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.asap(
                                  fontSize: 9,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(71, 71, 71, 1),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 200,
                                height: 20,
                                //alignment: Alignment.center,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data['activities'].length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Container(
                                          margin: const EdgeInsets.all(2),
                                          padding: const EdgeInsets.all(2),
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)),
                                            color: Color.fromRGBO(
                                                216, 211, 211, 1),
                                          ),
                                          child: Text(
                                            data['activities'][index],
                                            style: GoogleFonts.asap(
                                              fontSize: 13,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w400,
                                              color: const Color.fromRGBO(
                                                  71, 71, 71, 1),
                                            ),
                                          ));
                                    }),
                                // child: Column(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             Container(
                                //                 alignment: Alignment.center,
                                //                 decoration: const BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.all(
                                //                           Radius.circular(30)),
                                //                   color: Color.fromRGBO(
                                //                       216, 211, 211, 1),
                                //                 ),
                                //                 child: Text(
                                //                   data['activities'][0],
                                //                   style: GoogleFonts.asap(
                                //                     fontSize: 13,
                                //                     fontStyle: FontStyle.italic,
                                //                     fontWeight: FontWeight.w400,
                                //                     color: const Color.fromRGBO(
                                //                         71, 71, 71, 1),
                                //                   ),
                                //                 )),
                                //             Container(
                                //                 alignment: Alignment.center,
                                //                 decoration: const BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.all(
                                //                           Radius.circular(30)),
                                //                   color: Color.fromRGBO(
                                //                       216, 211, 211, 1),
                                //                 ),
                                //                 child: Text(
                                //                   'Drinks',
                                //                   style: GoogleFonts.asap(
                                //                     fontSize: 13,
                                //                     fontStyle: FontStyle.italic,
                                //                     fontWeight: FontWeight.w400,
                                //                     color: const Color.fromRGBO(
                                //                         71, 71, 71, 1),
                                //                   ),
                                //                 )),
                                //             Container(
                                //                 alignment: Alignment.center,
                                //                 decoration: const BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.all(
                                //                           Radius.circular(30)),
                                //                   color: Color.fromRGBO(
                                //                       216, 211, 211, 1),
                                //                 ),
                                //                 child: Text(
                                //                   'Games',
                                //                   style: GoogleFonts.asap(
                                //                     fontSize: 13,
                                //                     fontStyle: FontStyle.italic,
                                //                     fontWeight: FontWeight.w400,
                                //                     color: const Color.fromRGBO(
                                //                         71, 71, 71, 1),
                                //                   ),
                                //                 )),
                                //             Container(
                                //                 alignment: Alignment.center,
                                //                 decoration: const BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.all(
                                //                           Radius.circular(30)),
                                //                   color: Color.fromRGBO(
                                //                       216, 211, 211, 1),
                                //                 ),
                                //                 child: Text(
                                //                   'Music',
                                //                   style: GoogleFonts.asap(
                                //                     fontSize: 13,
                                //                     fontStyle: FontStyle.italic,
                                //                     fontWeight: FontWeight.w400,
                                //                     color: const Color.fromRGBO(
                                //                         71, 71, 71, 1),
                                //                   ),
                                //                 )),
                                //           ]),
                                //       const SizedBox(height: 5),
                                //       Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceAround,
                                //           children: [
                                //             Container(
                                //                 alignment: Alignment.center,
                                //                 decoration: const BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.all(
                                //                           Radius.circular(30)),
                                //                   color: Color.fromRGBO(
                                //                       216, 211, 211, 1),
                                //                 ),
                                //                 child: Text(
                                //                   'Networking',
                                //                   style: GoogleFonts.asap(
                                //                     fontSize: 13,
                                //                     fontStyle: FontStyle.italic,
                                //                     fontWeight: FontWeight.w400,
                                //                     color: const Color.fromRGBO(
                                //                         71, 71, 71, 1),
                                //                   ),
                                //                 )),
                                //             Container(
                                //                 alignment: Alignment.center,
                                //                 decoration: const BoxDecoration(
                                //                   borderRadius:
                                //                       BorderRadius.all(
                                //                           Radius.circular(30)),
                                //                   color: Color.fromRGBO(
                                //                       216, 211, 211, 1),
                                //                 ),
                                //                 child: Text(
                                //                   'Talks',
                                //                   style: GoogleFonts.asap(
                                //                     fontSize: 13,
                                //                     fontStyle: FontStyle.italic,
                                //                     fontWeight: FontWeight.w400,
                                //                     color: const Color.fromRGBO(
                                //                         71, 71, 71, 1),
                                //                   ),
                                //                 )),
                                //           ])
                                //     ]),
                              ),
                              const SizedBox(height: 30),
                              const Divider(
                                color: Color.fromRGBO(255, 84, 84, 0.54),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'DATE: ${data['date']}',
                                      style: GoogleFonts.asap(
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(71, 71, 71, 1),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      'TIME: ${data['time']}',
                                      style: GoogleFonts.asap(
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(71, 71, 71, 1),
                                      ),
                                    )
                                  ]),
                              const SizedBox(height: 10),
                              SizedBox(
                                  width: 46,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.pin_drop_outlined,
                                        color: Color.fromRGBO(255, 84, 84, 1),
                                        size: 15,
                                      ),
                                      Text(
                                        data['location'],
                                        style: GoogleFonts.asap(
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              71, 71, 71, 1),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 10),
                              Text(
                                'Location and directions will be '
                                'communicated upon payment',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.asap(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(71, 71, 71, 1),
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Divider(
                                color: Color.fromRGBO(255, 84, 84, 0.54),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Attending',
                                            style: GoogleFonts.asap(
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  71, 71, 71, 1),
                                            )),
                                        Image.asset(attendee)
                                      ]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Sluts Left',
                                            style: GoogleFonts.asap(
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  71, 71, 71, 1),
                                            )),
                                        Text(data['slot_book'].toString(),
                                            style: GoogleFonts.asap(
                                              fontSize: 20,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  71, 71, 71, 1),
                                            )),
                                      ]),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                data['price'],
                                style: GoogleFonts.asap(
                                  fontSize: 45,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(255, 84, 84, 1),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 28,
                                width: 138,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('BOOK A SLUT',
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
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
