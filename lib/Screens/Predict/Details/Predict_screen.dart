import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saca/Screens/homepage/home.dart';
import 'package:saca/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Predict_screen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (BuildContext context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.nunitoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: PredictPage(),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}

class PredictPage extends StatelessWidget {
  final purpleColor = Color(0xff0e9229);
  final darkTextColor = Color(0xff1F1A3D);
  final lightTextColor = Color(0xff999999);
  final textFieldColor = Color(0xffF5F6FA);
  final borderColor = Color(0xff0e9229);

  Widget getTextField({required String hint}) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xff0e9229), width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xff0e9229), width: 0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          filled: true,
          fillColor: textFieldColor,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      backgroundColor: Color(0xff0e9229),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
         ),
      title: Text("Crops Yields Prediction"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
                child:Card(child: Text('Hell0')),
              ),
              /*Text(
                "Crop Yields Prediction",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: darkTextColor,
                ),
              ),*/
              SizedBox(
                height: 4.h,
              ),
              Wrap(
                children: [
                  Text(
                    "Input environment features",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: lightTextColor,
                    ),
                  ),
                  /*Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: purpleColor,
                    ),
                  ),*/
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              getTextField(hint: "Enter Temperature"),
              SizedBox(
                height: 16.h,
              ),
              getTextField(hint: "Enter Humidity"),
              SizedBox(
                height: 16.h,
              ),
              getTextField(hint: "Enter Soil Moisture"),
              SizedBox(
                height: 16.h,
              ),
              getTextField(hint: "Enter Area"),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                     Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context){
                    return MyAppp();
                  }
                  )
                );
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(purpleColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14.h)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ))),
                  child: Text("Forecast Yields"),
                ),
              ),
              SizedBox(height: 16.h,),
           /*  Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 16.w,),
                  Text(
                    "or sign up via",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: lightTextColor,
                    ),
                  ),
                  SizedBox(width: 16.w,),
                  Expanded(child: Divider()),
                ],
              ),*/
             /* SizedBox(height: 16.h,),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(color: borderColor,)),
                      foregroundColor: MaterialStateProperty.all(darkTextColor),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 14.h)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    /*children: [
                      Image.asset("assets/Google.png"),
                      SizedBox(width : 10.w),
                      Text("Google"),
                    ],*/
                  ),
                ),
              ),*/
              SizedBox(height: 16.h,),
              Wrap(
                children: [
                 /* Text(
                    "By signing up to Masterminds you agree to our ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: lightTextColor,
                    ),
                  ),
                  Text(
                    "terms and conditions",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: purpleColor,
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}