import 'package:saca/Screens/Login/components/login_form.dart';
import 'package:saca/Screens/Login/components/main_page.dart';
import 'package:saca/Screens/Login/login_screen.dart';
import 'package:saca/Screens/Signup/signup_screen.dart';
import 'package:saca/Screens/Welcome/welcome_screen.dart';
import 'package:saca/Screens/homepage/home.dart';
import 'package:saca/auth/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // try{} catch(e){
   // print('Init failed' + e.toString());
 // }
  runApp(
    MaterialApp( 
      home : MyApp()
    )
    );
 // _init();
}
/*
_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    Get.offAll(() => MyAppp());
  } else {
    Get.offAll(() => LoginScreen());
  }
}
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomeScreen(),
    );
  }
}



