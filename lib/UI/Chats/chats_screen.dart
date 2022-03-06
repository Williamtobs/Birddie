import 'package:birddie/Services/services.dart';
import 'package:birddie/UI/Shared/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/chat_model.dart';
import '../ChatWidget/message_body.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String secUser = 'ActR8iQxWDBWPAgD7efz';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPersistentFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(backGround),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 80),
                SizedBox(
                  height: 110,
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
                        alignment: Alignment.bottomRight,
                        child: Container(
                            width: 358,
                            height: 76,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11.0)),
                                color: Color.fromRGBO(255, 84, 84, 0.9)),
                            child: Container(
                              width: 348,
                              height: 63,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(11.0)),
                                  color: Color.fromRGBO(255, 208, 208, 1)),
                              child: Row(
                                children: [
                                  //continue, add image assets
                                  Container(
                                    height: 52,
                                    width: 56,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                      image: DecorationImage(
                                          image: AssetImage(avatar),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Sonia 26',
                                        style: GoogleFonts.asap(
                                          fontSize: 26,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              58, 58, 58, 1),
                                        ),
                                      ),
                                      Text(
                                        'Lounge 526',
                                        style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              58, 58, 58, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                      width: 79,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          color:
                                              Color.fromRGBO(255, 84, 84, 1)),
                                      child: Text(
                                        'Call',
                                        style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              253, 253, 253, 1),
                                        ),
                                      )),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 358,
                  child: Stack(
                    children: [
                      Container(
                        height: 358,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(233, 231, 231, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(11))),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 50, top: 10),
                            child: MessageWidget(
                              idUser: auth.currentUser!.uid,
                            )),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 35,
                                  child: TextField(
                                    controller: chatController,
                                    maxLines: 1,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sendMessage();
                                      // messages.add(
                                      //   ChatMessage(
                                      //       messageContent: chatController.text,
                                      //       messageType: "sender"),
                                      // );
                                      // chatController.clear();
                                    });
                                  },
                                  child: Container(
                                      width: 79,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          color:
                                              Color.fromRGBO(255, 84, 84, 1)),
                                      child: Text(
                                        'Send',
                                        style: GoogleFonts.asap(
                                          fontSize: 15,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              253, 253, 253, 1),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendMessage() async {
    FocusScope.of(context).unfocus();
    await FirebaseService.uploadMessage(
        auth.currentUser!.uid, chatController.text, secUser);
    chatController.clear();
  }

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
}



// Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       warning,
//                                       width: 48,
//                                       height: 48,
//                                     ),
//                                     const SizedBox(
//                                       width: 15,
//                                     ),
//                                     SizedBox(
//                                       width: 211,
//                                       child: Text(
//                                         'Exchanging phone numbers in chat is a '
//                                         'violation of terms and condion.',
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.asap(
//                                             fontSize: 10,
//                                             fontStyle: FontStyle.normal,
//                                             fontWeight: FontWeight.w400,
//                                             color: const Color.fromRGBO(
//                                                 255, 84, 84, 1)),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     // r
//                                   ],
//                                 ),
//                               ],
//                             ),