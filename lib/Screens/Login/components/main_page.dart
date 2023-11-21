import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saca/Screens/homepage/home.dart';
import 'package:saca/auth/home_page.dart';
import 'login_form.dart';

class HomeLogin extends StatelessWidget{
  const HomeLogin({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return MyAppp();
            }else{
              return LoginForm();
            }
          },
        ),
      );
    }
}