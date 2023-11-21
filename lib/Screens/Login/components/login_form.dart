import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saca/Screens/Login/components/main_page.dart';
import 'package:saca/Screens/home/home_screen.dart';
import 'package:saca/Screens/homepage/home.dart';
import 'package:saca/Screens/Login/login_screen.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../main.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import '../../Signup/signup_screen.dart';
import 'package:get/get.dart';
import 'package:saca/FIREBASE_AUTH/firebaseauth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key }) : super(key: key);

//@override
State<LoginForm> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginForm>{

//controllers
final _controllerEmail = TextEditingController();
final _controllerPassword = TextEditingController();

Future login() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _controllerEmail.text.trim(), 
    password: _controllerPassword.text.trim(),
    );
}

@override
void dispose(){
  _controllerEmail.dispose();
  _controllerPassword.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return  Material(
    child : Form(
        child: Column(
          children: [
            TextFormField(
              controller: authController.loginEmailController ,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Enter your Email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: authController.loginPasswordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding : const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: (() {
                  authController.loginUser();
                }),
                child: Container(
                  padding: EdgeInsets.all(15),
                  
                  decoration: BoxDecoration(
                    color: Color(0xff0e9229),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              
              ),
           /* Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return signIn,
                  }));
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
            */
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      
    )
    );
  }

}