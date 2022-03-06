import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class UpgradeAccounts extends StatelessWidget {
  const UpgradeAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(239, 239, 239, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: Color.fromRGBO(255, 84, 84, 1),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Upgrade',
                style: GoogleFonts.asap(
                  fontSize: 27,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(255, 84, 84, 1),
                ),
              ),
            ),
            Center(
              child: Text(
                'your account to',
                style: GoogleFonts.asap(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(255, 84, 84, 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: 550,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    border: Border.all(
                        color: const Color.fromRGBO(255, 84, 84, 1))),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Birddie Premium',
                      style: GoogleFonts.asap(
                        fontSize: 33,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 84, 84, 1),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Subscribe to any of the premium plans '
                        'and enjoy lots of benefits that '
                        'comes with it',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.asap(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(71, 71, 71, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: SizedBox(
                        height: 419,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 165,
                                height: 98,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    color: Color.fromRGBO(255, 122, 122, 1)),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Yearly',
                                    style: GoogleFonts.asap(
                                      fontSize: 17,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          216, 216, 216, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 165,
                                height: 98,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    color: Color.fromRGBO(255, 84, 84, 1)),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Monthly',
                                    style: GoogleFonts.asap(
                                      fontSize: 17,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 300,
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    color: Color.fromRGBO(255, 84, 84, 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'N5,000',
                                      style: GoogleFonts.asap(
                                        fontSize: 58,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            255, 238, 84, 1),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Divider(
                                      color: Color.fromRGBO(255, 238, 84, 0.2),
                                      thickness: 2,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Get access to premium features',
                                      style: GoogleFonts.asap(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                    Text(
                                      '\u2022 \tSee your dates Videos\n'
                                      '\u2022 \tSelect dates from our list\n'
                                      '\u2022 \tGet access to private location\n'
                                      '\u2022 \tGet exquisite dining\n'
                                      '\u2022 \tGet up 40% discount on you dates\n'
                                      '\u2022 \tAccess event details and get tickets',
                                      style: GoogleFonts.asap(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 45,
                                        width: 181,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          //getNextPage,
                                          child: Text('Subscribe',
                                              style: GoogleFonts.asap(
                                                  fontSize: 15,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromRGBO(
                                                      255, 84, 84, 1))),
                                          style: ElevatedButton.styleFrom(
                                            primary: const Color.fromRGBO(
                                                255, 238, 84, 1),
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
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
}
