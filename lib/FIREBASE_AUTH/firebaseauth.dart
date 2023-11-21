import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:saca/Screens/Login/components/login_form.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:saca/Screens/Login/login_screen.dart';
import 'package:saca/Screens/homepage/finalhome/finalhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saca/Screens/homepage/home.dart';


class AuthController extends GetxController {
  // sign up text editing controllers

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

 Future<String> getCurrentUID() async {
    return (await _auth.currentUser!).uid;
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return await _auth.currentUser!;
  }

  Future<void> createAccount() async {
    final User = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(User.user!.uid).set(
        {"email": emailController.text, "password": passwordController.text,
        "name": fnameController.text, "number": numController.text,
        "address": addressController.text});
    if (User != null) {
      Get.  to(() => MobileLoginScreen());
    } else {
      print('error');
    }
  }

/*
 storeNewUser(user, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData({'email': user.email, 'uid': user.uid})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home())))
        .catchError((e) {
          print(e);
        });
  }
*/

  Future<void> loginUser() async {
    final User = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    if (User != null) {
      // lets save user with shared prefrences

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userID", User.user!.uid);
      print(User.user!.uid);
      Get.to(() => Home());
    } else {
      print('error');
    }
  }

  // Let's make a function for logout

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => MobileLoginScreen());
  }

 
}
