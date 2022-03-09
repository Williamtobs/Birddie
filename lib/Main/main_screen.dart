import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//import '../Models/user_model.dart';
import '../Startup/initial_page.dart';
import '../UI/Dashboard/dashboard_screen.dart';
import '../UI/InformationScreens/data_screens.dart';
import '../UI/InformationScreens/user_profile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snaphot) {
          if (snaphot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
            // ignore: unnecessary_null_comparison
          } else if (!snaphot.hasData || snaphot == null) {
            return const InitialPage();
          } else if (snaphot.hasError) {
            return Center(
              child: Text('${snaphot.error}'),
            );
          }
          return const DashBoardScreen();
        });
  }
}
