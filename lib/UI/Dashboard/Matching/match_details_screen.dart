import 'package:birddie/UI/Dashboard/Events/event_screens.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({Key? key}) : super(key: key);

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
              SizedBox(
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
                              'Oct 20  ',
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
                              '  03:30pm ',
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
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(11.0)),
                            color: Color.fromRGBO(250, 160, 160, 1)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Text(
                                    'Lounge 526',
                                    style: GoogleFonts.asap(
                                      fontSize: 26,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          const Color.fromRGBO(58, 58, 58, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  SizedBox(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(3),
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
                                          const SizedBox(width: 4),
                                          Container(
                                              padding: const EdgeInsets.all(3),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Color.fromRGBO(
                                                    216, 211, 211, 1),
                                              ),
                                              child: Text(
                                                'Bar',
                                                style: GoogleFonts.asap(
                                                  fontSize: 10,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      58, 58, 58, 1),
                                                ),
                                              )),
                                          const SizedBox(width: 4),
                                          Container(
                                              padding: const EdgeInsets.all(3),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Color.fromRGBO(
                                                    216, 211, 211, 1),
                                              ),
                                              child: Text(
                                                'Pool',
                                                style: GoogleFonts.asap(
                                                  fontSize: 10,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      58, 58, 58, 1),
                                                ),
                                              )),
                                          const SizedBox(width: 4),
                                          Container(
                                              padding: const EdgeInsets.all(3),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Color.fromRGBO(
                                                    216, 211, 211, 1),
                                              ),
                                              child: Text(
                                                'Food',
                                                style: GoogleFonts.asap(
                                                  fontSize: 10,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      58, 58, 58, 1),
                                                ),
                                              )),
                                          const SizedBox(width: 4),
                                          Container(
                                              padding: const EdgeInsets.all(3),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Color.fromRGBO(
                                                    216, 211, 211, 1),
                                              ),
                                              child: Text(
                                                'Wifi',
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
                                  const SizedBox(height: 6),
                                  Container(
                                    width: 120,
                                    child: Text(
                                      '3455 adeyemi street off Abrahm sakila '
                                      'street , Ikeja',
                                      style: GoogleFonts.asap(
                                        fontSize: 10,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(58, 58, 58, 1),
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
                                          '02',
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
                                        color:
                                            Color.fromRGBO(253, 253, 253, 1)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
