import 'package:birddie/Startup/second_page.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatefulWidget{

  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  getNextPage(){
    Get.to(SecondPage(getNumber()));
  }

  getNumber(){
    return controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(first),
              fit: BoxFit.fill,
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color.fromRGBO(235, 18, 18, 1),
                Colors.transparent],
                begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )
              ),
            )
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(logo,
                    width: 116,
                    height: 114,),
                ),
                const SizedBox(height: 30,),
                Text('Enter your phone number',
                  style: GoogleFonts.asap(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)
                  ),),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 270,
                  height: 43,
                  child: TextFields(hintText: 'PHONE NUMBER', controller: controller,
                    inputType: TextInputType.number,
                  style: GoogleFonts.asap(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(71, 71, 71, 1)
                  ), color: const Color.fromRGBO(255, 84, 84, 1),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 48,
                  width: 170,
                  child:  ElevatedButton(
                    onPressed: () {
                      getNextPage();
                    }, child:
                  Text('NEXT',style: GoogleFonts.asap(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1)
                  )),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(255, 84, 84, 1),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}