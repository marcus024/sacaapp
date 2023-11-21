import 'package:flutter/material.dart';
import 'package:saca/Screens/Pests/pestdetails/xd_add_pest1.dart';
import 'package:saca/Screens/Predict/Details/Predict_screen.dart';
import 'package:saca/Screens/crops/components/design.dart';
import 'package:saca/Screens/crops/components/itemCrop.dart';
import 'package:saca/Screens/homepage/home.dart';
import 'package:saca/constants.dart';

class StemScreen extends StatelessWidget{

  @override
Widget build(BuildContext context){
  return Scaffold(
   /* appBar: AppBar(
      elevation: 3,
    backgroundColor: Color(0xff0e9229),
    leading: IconButton(
      icon: Icon (Icons.arrow_back_ios_new_outlined),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text("Banana",textAlign: TextAlign.center,),
    ),*/
      body: SafeArea(
        bottom: true,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 450),
                        Text(
                          "Stem Borer",
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize:30 ,
                            color: Color(0xff0e9229),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Yellow Stem Borer',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff0e9229),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      
                        SizedBox(height: 20),
                        Text(
                          "Scientific Name",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff868686),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Divider(color: Colors.black38),
                        Text(
                          'Chilo Polychrysus',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff0e9229),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                         SizedBox(height: 20),
                        Text(
                          "Description",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff868686),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Divider(color: Colors.black38),
                        Text(
                          'A stem borer is any insect larva, or arthpod that bores into plant stems.',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff0e9229),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),


                           SizedBox(height: 20),
                        Text(
                          "Prevention",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff868686),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Divider(color: Colors.black38),
                        Text(
                          'Avoid planting cucurbits in the same plot, or cucumners,melons or watermelons as borers hardly threaten them. Lastly,you can cut off the infected vine and cover with soil for not growth.',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff0e9229),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),

                      ],
                    ),
                  ),
                 /* Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Benefits',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: const Color(0xff868686),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),

                  ),*/
                  Container(
                    height: 200,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                           /* child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),*/
                          );
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Hero(
                  tag:Positioned,
                  child: Image.asset("assets/images/saging.jpg")),
            ),
            Positioned(
              top: 60,
              left: -70,
              child: Text(
                "Stem Borer",
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 200,
                  color: Color(0xff0e9229).withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
         IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Color(0xff0e9229),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            
           
          ],
        ),
      ),
    );
  }
}

