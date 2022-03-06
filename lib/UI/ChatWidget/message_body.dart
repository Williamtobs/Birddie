import 'package:birddie/Models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Data/dummy_data.dart';
import '../../Services/services.dart';
import '../Shared/images.dart';

class MessageWidget extends StatelessWidget {
  final String idUser;

  const MessageWidget({Key? key, required this.idUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: FirebaseService.getMessages(idUser),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Text('Something Went Wrong Try later');
              } else {
                final messages = snapshot.data;
                return messages!.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset(
                              warning,
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 211,
                              child: Text(
                                'Exchanging phone numbers in chat is a '
                                'violation of terms and condion.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.asap(
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(255, 84, 84, 1)),
                              ),
                            ),
                          ])
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return Container(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: Align(
                                alignment: (message.idUser != myId
                                    ? Alignment.topLeft
                                    : Alignment.topRight),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: message.idUser != myId
                                        ? const BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(0),
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30))
                                        : const BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(0),
                                          ),
                                    color: (message.idUser != myId
                                        ? const Color.fromRGBO(131, 131, 131, 1)
                                        : const Color.fromRGBO(
                                            255, 108, 108, 1)),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    message.message,
                                    style: GoogleFonts.asap(
                                      fontSize: 11,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromRGBO(
                                          253, 253, 253, 1),
                                    ),
                                  ),
                                ),
                              ));
                        },
                      );
              }
          }
        });
  }
}
