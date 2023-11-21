import 'package:flutter/material.dart';
import 'package:saca/FIREBASE_AUTH/firebaseauth.dart';
import 'package:get/get.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              autofocus : true,
              controller: authController.fnameController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Enter your Full Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                autofocus : true,
                controller: authController.emailController,
                textInputAction: TextInputAction.done,
                obscureText: false,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Icon(Icons.email),
                  ),
                ),
              ),
            ),
        
        TextFormField(
          autofocus : true,
              controller: authController.numController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Enter your Mobile Number",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.numbers),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                autofocus : true,
                controller: authController.passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
        TextFormField(
          autofocus : true,
              controller: authController.addressController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Enter your Address",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.place),
                ),
              ),
            ),
           
         const SizedBox(height: defaultPadding / 1),
      
            ElevatedButton(
              onPressed: () {
                authController.createAccount();
              },
              child: Text("REGISTER".toUpperCase()),
            ),
        const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // ignore: prefer_const_constructors
                      return MobileLoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}