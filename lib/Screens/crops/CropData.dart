import 'package:flutter/material.dart';
import 'package:saca/Screens/Predict/Details/Predict_screen.dart';
import 'package:saca/Screens/crops/Cropdetails/banana.dart';
import 'package:saca/Screens/crops/Cropdetails/corn.dart';
import 'package:saca/Screens/crops/Cropdetails/peanut.dart';
import 'package:saca/Screens/crops/Cropdetails/pineapple.dart';
import 'package:saca/Screens/crops/Cropdetails/rice.dart';
import 'package:saca/Screens/crops/Cropdetails/xd_add_crops1.dart';
import 'package:saca/Screens/crops/components/design.dart';
import 'package:saca/Screens/crops/components/itemCrop.dart';
import 'package:saca/Screens/homepage/home.dart';
import './components/cropItem.dart';


class CropsGrid extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Scaffold(
   appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
         ),
     backgroundColor: Color(0xff0e9229),
       title: const Text("Crops Database"),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BananaScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.grass_outlined,size: 50,color: Colors.white,),
              Text("Banana",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),
         InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PineappleScreen()));
            },
           child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.grass_outlined,size: 50,color: Colors.white,),
              Text("Pineapple",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
         ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PeanutScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.grass_outlined,size: 50,color: Colors.white,),
              Text("Peanut",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RiceScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.grass_outlined,size: 50,color: Colors.white,),
              Text("Rice",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CornScreen()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xff0e9229),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.grass_outlined,size: 50,color: Colors.white,),
              Text("Corn",style: TextStyle(color: Colors.white,fontSize: 12),)
            ],),
            ),
          ),
         InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCrop()));
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