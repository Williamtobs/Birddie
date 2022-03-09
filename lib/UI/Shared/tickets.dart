import 'package:birddie/Services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'images.dart';

class Tickets extends StatelessWidget {
  final String? name;
  final String? location;
  final String? date, price_slang, time;
  final int? slots_book;
  Tickets(
      {Key? key,
      this.name,
      this.location,
      this.date,
      this.price_slang,
      this.time,
      this.slots_book})
      : super(key: key);

  var service = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 140,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 84, 84, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name!,
                        style: GoogleFonts.asap(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                          'Come and relive those good times, '
                          'hang with old friends and make new one ',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.asap(
                            fontSize: 9,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 3,
                ),
                Text('|  $location',
                    style: GoogleFonts.asap(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                const Spacer(),
                Text("N${price_slang!}",
                    style: GoogleFonts.asap(
                      fontSize: 43,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Attending',
                      style: GoogleFonts.asap(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Image.asset(attendee)
                ]),
                const SizedBox(
                  width: 10,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Sluts Left',
                      style: GoogleFonts.asap(
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Text(slots_book.toString(),
                      style: GoogleFonts.asap(
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      )),
                ]),
                const Spacer(),
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(date!,
                      style: GoogleFonts.asap(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      )),
                  Text(time!,
                      style: GoogleFonts.asap(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      )),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
