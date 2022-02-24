import 'package:birddie/Startup/third_page.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget{

  final String? num;
  const SecondPage(this.num, {Key? key,}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  getNextPage(){
    Get.to(const ThirdScreen());
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
                image: DecorationImage(image: AssetImage(second),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35.0, bottom: 30),
                    child: Image.asset(logo,
                      width: 116,
                      height: 114,),
                  ),
                ),
                const SizedBox(height: 30,),
                Text('Enter code sent to',
                  style: GoogleFonts.asap(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)
                  )),
                Text(widget.num!,
                  style: GoogleFonts.asap(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)
                  ),),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 270,
                  height: 43,
                  child: TextFields(hintText: 'ENTER OTP',
                    style: GoogleFonts.asap(
                        fontSize: 15,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(71, 71, 71, 1)
                    ),
                    controller: controller, inputType: TextInputType.number, color: const Color.fromRGBO(255, 84, 84, 1),),
                ),
                const SizedBox(height: 10,),
                Text('Resend OTP',
                  style: GoogleFonts.asap(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(255, 255, 255, 1)
                  ),),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 48,
                  width: 170,
                  child:  ElevatedButton(
                    onPressed: () {
                      getNextPage();
                    }, child:
                  Text('VERIFY',style: GoogleFonts.asap(
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