import 'dart:async';

import 'package:birddie/UI/Dashboard/Matching/matching.dart';
import 'package:birddie/UI/Dashboard/Matching/review_match_screen.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    Timer(const Duration(seconds: 10), () {
      controller!.repeat();
      if (widget.category == 'Match Metrix') {
        goTo(const Matching());
      }
      goTo(ReviewingMatch(
        category: widget.category,
      ));
      // Get.to(ReviewingMatch(
      //   category: widget.category,
      // ));
      super.initState();
      //controller!.repeat();
    });
    // Timer(
    //     const Duration(seconds: 10),
    //     () =>
    //Get.to(const Matching());
  }
  goTo(Widget dir) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('category', widget.category);
    pref.setBool('page', true);
    Get.offAll(dir);
  }
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
        title: Text('Matching',
            style: GoogleFonts.asap(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(255, 255, 255, 1),
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
                animation: controller!,
                child: Image.asset(
                  match,
                  width: 199,
                  height: 199,
                ),
                builder: (BuildContext context, Widget? _widget) {
                  return Transform.rotate(
                    angle: controller!.value * 4,
                    child: _widget,
                  );
                }),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text('Analyzing your data',
                style: GoogleFonts.asap(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text('Verifying your data',
                style: GoogleFonts.asap(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text('Submitting your data',
                style: GoogleFonts.asap(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text('Searching for matches',
                style: GoogleFonts.asap(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                )),
          ),
        ],
      ),
    );
  }
}
