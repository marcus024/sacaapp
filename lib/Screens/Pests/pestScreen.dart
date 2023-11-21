import 'package:flutter/material.dart';
import 'package:saca/Screens/Pests/pestdetails/aphids.dart';
import 'package:saca/Screens/Pests/pestdetails/armyworm.dart';
import 'package:saca/Screens/Pests/pestdetails/beetle.dart';
import 'package:saca/Screens/Pests/pestdetails/bollworm.dart';
import 'package:saca/Screens/Pests/pestdetails/grassh.dart';
import 'package:saca/Screens/Pests/pestdetails/mites.dart';
import 'package:saca/Screens/Pests/pestdetails/mosq.dart';
import 'package:saca/Screens/Pests/pestdetails/sawfly.dart';
import 'package:saca/Screens/Pests/pestdetails/stem.dart';
import 'package:saca/Screens/Pests/pestdetails/xd_add_pest1.dart';
import 'package:saca/Screens/Predict/Details/Predict_screen.dart';
import 'package:saca/Screens/crops/components/design.dart';
import 'package:saca/Screens/crops/components/itemCrop.dart';
import 'package:saca/Screens/homepage/home.dart';



class PestGrid extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Scaffold(
  appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
         ),
     backgroundColor: Color(0xff0e9229),
       title: const Text("Detect Pest"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
              
             
        ),
        elevation: 0.00,
    ),
  body: Container(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView(children:[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AphidsScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Aphids",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),
         InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MosquitoScreen()));
            },
           child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Mosquito",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
         ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GrassScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Grasshopper",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MitesScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Mites",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BeetleScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Beetle",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

   InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SawflyScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Sawfly",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

   InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StemScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Stem Borer",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

   InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BollwormScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Bollworm",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

   InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ArmywormScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.bug_report_outlined,size: 50,color: Colors.white,),
              Text("Armyworm",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

          
         InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPest()));
            },
           child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.add,size: 50,color: Colors.white,),
              Text("Add",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
         ),
      


        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 20,crossAxisSpacing: 30),
        ),
      ),),





  ); 
}

}