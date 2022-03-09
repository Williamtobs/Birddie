import 'package:birddie/Models/match.darts.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/match_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class Matching extends StatelessWidget {
  const Matching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text('Match Metrix',
            style: GoogleFonts.asap(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(255, 255, 255, 1),
            )),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Match").snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data?.docs.length == 0) {
              return const Center(child: Text("No available match yet"));
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 188,
                      child: Text('Select a match from the list below',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.asap(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(71, 71, 71, 1),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot<Map<String, dynamic>> list =
                                  snapshot.data.docs[index];
                              return MatchCard(
                                name: list.data()!['name'],
                                job: list.data()!['job'],
                                location: list.data()!['location'],
                                matchCriteria: list.data()!['matchCriteria'],
                                age: list.data()!['age'],
                                video: list.data()!['videoUrl'],
                              );
                            }),
                      ),
                    )
                  ]),
            );
          }),
    );
  }
}
