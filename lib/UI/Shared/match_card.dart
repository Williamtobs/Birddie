import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchCard extends StatelessWidget{
  const MatchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 125,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 84, 84, 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            SizedBox(
              width: 187,
              height: 110,

            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text('Samantha, 22',
                    style: GoogleFonts.asap(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                const SizedBox(height: 5),
                Text('Job Title:\tDeveloper',
                    style: GoogleFonts.asap(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                Text('Location\tIkeja',
                    style: GoogleFonts.asap(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    )),
                Row(
                  children: [
                    Text('Match\nCriteria',
                        style: GoogleFonts.asap(
                          fontSize: 10,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                    const SizedBox(width: 5,),
                    Text('92%',
                        style: GoogleFonts.asap(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                  ],
                ),
                Align(
                  child: SizedBox(
                      width: 76,
                      height: 18,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Match Me',
                          style: GoogleFonts.asap(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 238, 84, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(255, 84, 84, 1),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                color: Color.fromRGBO(255, 238, 84, 1),
                              )
                          ),
                        ),
                      ),
                )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}