import 'dart:async';
import 'dart:io';

import 'package:birddie/Models/about_model.dart';
import 'package:birddie/Models/user_model.dart';
import 'package:birddie/UI/InformationScreens/data_screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as Path;

import '../Data/dummy_data.dart';
import '../Models/message_model.dart';
import '../Models/user_chat.dart';
import '../UI/InformationScreens/user_profile.dart';
import '../Util/utils.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var uid;
  FirebaseStorage storage = FirebaseStorage.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  static Stream<List<UserChat>> getUsers() => FirebaseFirestore.instance
      .collection('users')
      .orderBy(UserField.lastMessageTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(UserChat.fromJson));

  static Future uploadMessage(
      String idUser, String message, String secUser) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$idUser/messages');
    final newMessage = Message(
      idUser: myId,
      urlAvatar: myUrlAvatar,
      username: myUsername,
      message: message,
      createdAt: DateTime.now(),
    );
    await refMessages.add(newMessage.toJson());
    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers
        .doc(secUser)
        .update({UserField.lastMessageTime: DateTime.now()});
  }

  static Stream<List<Message>> getMessages(String idUser) =>
      FirebaseFirestore.instance
          .collection('chats/$idUser/messages')
          .orderBy(MessageField.createdAt, descending: true)
          .snapshots()
          .transform(Utils.transformer(Message.fromJson));

  static Future addRandomUsers(List<UserChat> users) async {
    final refUsers = FirebaseFirestore.instance.collection('users');

    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copyWith(idUser: userDoc.id);

        await userDoc.set(newUser.toJson());
      }
    }
  }

  Future<void> uploadImage(File image) async {
    String fileName = Path.basename(image.path);
    File imageFile = File(image.path);
    try {
      await storage.ref('images/$fileName').putFile(
          imageFile,
          SettableMetadata(customMetadata: {
            'uploaded_by': _auth.currentUser!.uid,
          }));
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future downoloadVid() async {}

  Future<String> uploadVideo(File image) async {
    String fileName = Path.basename(image.path);
    File imageFile = File(image.path);
    var url;
    Reference storageReference = storage.ref().child('videos/$fileName');
    try {
      UploadTask uploadTask = storageReference.putFile(
          imageFile,
          SettableMetadata(customMetadata: {
            'uploaded_by': _auth.currentUser!.uid,
          }));

      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return url!;
  }
  // Future<AboutModels> getDetails() async {
  //   List<AboutModels> _list = [];
  //   if (_auth.currentUser != null) {
  //     uid = _auth.currentUser?.uid;
  //     await userCollection.doc(uid).get().then((doc) {
  //       if (doc.exists){

  //       }
  //     });
  //   }

  Future<void> userDetails(
      String? stateOfOrigin,
      String? occupation,
      String? region,
      String? area,
      String? lookingFor,
      String? alcohol,
      String? smoke,
      File? video,
      String? videoPath,
      File? image) async {
    if (_auth.currentUser != null) {
      uid = _auth.currentUser?.uid;

      AboutModels user = AboutModels(
          uid: uid,
          stateOfOrigin: stateOfOrigin,
          occupation: occupation,
          region: region,
          area: area,
          lookingFor: lookingFor,
          alcohol: alcohol,
          smoke: smoke,
          video: video,
          videoPath: videoPath,
          image: image);

      DocumentReference documentReferencer = userCollection.doc(uid);
      //print(videoPath);
      print(videoPath);
      var data = user.toJson();
      await documentReferencer.update(data).whenComplete(() {
        print("User data added");
        Get.to(const UserProfile());
      }).catchError((e) => print(e));
    }
  }

  // Future<List<String>> fetchLocation(int index) async {
  //   FirebaseFirestore collect = FirebaseFirestore.instance;
  //   List<String> items = [];
  //   CollectionReference location = collect.collection('States');
  //   DocumentSnapshot snap = await location.doc('ukOBOkAZ6XyvcXfOeeGf').get();
  //   var data = snap.data() as Map;
  //   var statesData = data[index];
  //   print(statesData);
  //   for (var element in statesData) {
  //     print(element);
  //     items.add(element);
  //   }
  //   return items;
  // }

  Future<void> userSetup(
    String dateOfBirth,
    String occupation,
    String gender,
    bool perm,
  ) async {
    if (_auth.currentUser != null) {
      uid = _auth.currentUser?.uid;

      DocumentReference documentReferencer = userCollection.doc(uid);

      Users users = Users(
        uid: uid,
        dateOfBirth: dateOfBirth,
        occupation: occupation,
        gender: gender,
        perm: perm,
      );
      var data = users.toJson();
      await documentReferencer.set(data).whenComplete(() {
        print("User data added");

        Get.to(const InfoScreen());
      }).catchError((e) => print(e));
    }
    return;
  }
}

// ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("Failed to sign in: " + e.toString()),
//       backgroundColor: Colors.green.shade300,
//     ));
// FirebaseAuth auth = FirebaseAuth.instance;
//     var user = auth.currentUser;
//     FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
//       'dateOfBirth': dateOfBirth,
//       'occupation': occupation,
//       'gender': gender,
//       'perm': perm,
//       'uid': user.uid
//     });
