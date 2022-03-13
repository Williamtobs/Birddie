import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Main/main_screen.dart';
import 'UI/Dashboard/Matching/review_match_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var state = pref.getBool('page');
  var cat = pref.getString('category');
  runApp(MyApp(state: state, category: cat,));
}

class MyApp extends StatelessWidget {
  final state;
  final category;
  const MyApp({Key? key, this.state, this.category}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Birddie',
        debugShowCheckedModeBanner: false,
        home: state == null && category == null ? const MainScreen() : ReviewingMatch(category: category,)
    );
  }
}
