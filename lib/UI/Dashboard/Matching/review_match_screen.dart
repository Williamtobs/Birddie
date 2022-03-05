import 'package:birddie/UI/Dashboard/Events/event_screens.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'match_details_screen.dart';

class ReviewingMatch extends StatelessWidget {
  const ReviewingMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(const EventScreen());
                        },
                        child: const Tickets()),
                    const SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          Get.to(const EventScreen());
                        },
                        child: const Tickets()),
                  ],
                ),
              ),
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
              child: Text(
                'You will be matched within 24hrs!',
                style: GoogleFonts.asap(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(58, 89, 136, 1),
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
                              'Russian Roulette',
                              style: GoogleFonts.asap(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(253, 253, 253, 1),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '__  __  ',
                              style: GoogleFonts.asap(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(71, 71, 71, 1),
                              ),
                            ),
                            Text(
                              ' | ',
                              style: GoogleFonts.asap(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(253, 253, 253, 1),
                              ),
                            ),
                            Text(
                              ' --:--pm ',
                              style: GoogleFonts.asap(
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(71, 71, 71, 1),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your ideal date location: ',
                                  style: GoogleFonts.asap(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(58, 58, 58, 1),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Mainland',
                                  style: GoogleFonts.asap(
                                    fontSize: 26,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(58, 58, 58, 1),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
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
                                              'Ikeja',
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
                                              'Surulere',
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
                                              'Yaba',
                                              style: GoogleFonts.asap(
                                                fontSize: 10,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      color: Color.fromRGBO(216, 211, 211, 1),
                                    ),
                                    child: Text(
                                      'Bar',
                                      style: GoogleFonts.asap(
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(58, 58, 58, 1),
                                      ),
                                    )),
                                const SizedBox(height: 6),
                                Text(
                                  'Age Range',
                                  style: GoogleFonts.asap(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(58, 58, 58, 1),
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
                                        color: Color.fromRGBO(216, 211, 211, 1),
                                      ),
                                      child: Text(
                                        '24',
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
                                        color: Color.fromRGBO(216, 211, 211, 1),
                                      ),
                                      child: Text(
                                        '30',
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
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
  }
}
