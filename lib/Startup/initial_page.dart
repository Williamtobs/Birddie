import 'package:birddie/Constant/validators.dart';
import 'package:birddie/Startup/second_page.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:birddie/UI/Shared/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getNextPage() {
    if ((_formKey.currentState!.validate())) {
      registerUser(controller.text);
    }
  }

  getNumber() {
    return controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(first),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(235, 18, 18, 1),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      logo,
                      width: 116,
                      height: 114,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Enter your phone number',
                    style: GoogleFonts.asap(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 270,
                    height: 43,
                    child: TextFields(
                      hintText: 'PHONE NUMBER',
                      validate: validateTextField,
                      controller: controller,
                      inputType: TextInputType.number,
                      fillColor: const Color.fromRGBO(216, 211, 211, 1),
                      style: GoogleFonts.asap(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(71, 71, 71, 1)),
                      color: const Color.fromRGBO(255, 84, 84, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 48,
                    width: 170,
                    child: ElevatedButton(
                      onPressed: () async {
                        getNextPage();
                      },
                      child: Text('NEXT',
                          style: GoogleFonts.asap(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(255, 255, 255, 1))),
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
      ),
    );
  }

  Future registerUser(String mobile) async {
    setState(() {
      mobile = '+234 $mobile';
    });
    print(mobile);
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: mobile,
          timeout: const Duration(seconds: 5),
          verificationCompleted: _onVerificationCompleted,
          verificationFailed: _onVerificationFailed,
          codeSent: _onCodeSent,
          codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to Verify Phone Number: $e"),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Please check your phone for the verification code."),
      backgroundColor: Colors.green.shade300,
    ));
    Get.to(SecondPage(getNumber(), this.verificationId));
    print(forceResendingToken);
    print("code sent");
  }

  _codeAutoRetrievalTimeout(String verificationId) async {}

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    await auth.signInWithCredential(authCredential);
    print(auth.currentUser!.uid);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Phone number automatically verified and user signed in: ${auth.currentUser!.uid}"),
      backgroundColor: Colors.green.shade300,
    ));
    // User? user = FirebaseAuth.instance.currentUser;
    // setState(() {
    //   controller.text = authCredential.smsCode!;
    // });
    // if (authCredential.smsCode != null) {
    //   try{
    //     UserCredential credential =
    //     await user!.linkWithCredential(authCredential);
    //   }on FirebaseAuthException catch(e){
    //     if(e.code == 'provider-already-linked'){
    //       await auth.signInWithCredential(authCredential);
    //     }
    //   }
    //   setState(() {
    //     isLoading = false;
    //   });
    //   Get.to(const ThirdScreen());
    //}
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          "Phone number verification failed. Code: ${exception.code}. Message: ${exception.message}"),
      backgroundColor: Colors.red.shade300,
    ));
    // if (exception.code == 'invalid-phone-number') {
    //   showMessage("The phone number entered is invalid!");
    // }
  }
}
