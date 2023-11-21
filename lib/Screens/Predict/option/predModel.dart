// // import 'dart:ffi';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // // import 'package:tflite_flutter/tflite_flutter.dart';

// // class PredModel extends StatefulWidget {


// //   @override
// //   _PredModelState createState() => _PredModelState();
// // }

// // class _PredModelState extends State<PredModel> {
// //   var predValue = "";
// //   late Float temp ;
// //   late Float hum ;
// //   late Float soil;
// //   late Float area ;
// //   late Float sample ;

// //   @override 
// //   void initState() {
// //     super.initState();
// //     predValue = "click predict button";
// //   }

// //   Future predData() async {
    
// //     final interpreter =  await Interpreter.fromAsset('predmodel.tflite');
// //     var input = [
// //       [temp, hum, soil, area, sample]
// //     ];
// //     var output = List.filled(1, 0).reshape([1, 1]);
// //     interpreter.run(input, output);
// //     print(output[0][0]);

// //     this.setState(() {
// //       predValue = output[0][0].toString();
// //     });
// //   }

 
//   @override
//   Widget build(BuildContext context) {
 
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Padding(padding: EdgeInsets.all(3),
//                 child: TextField(
//                 onChanged: (value) {
//     temp = value as Float ;
//   },
//                   keyboardType: TextInputType.number,
//                        decoration: InputDecoration(
//                 hintText: "Enter your Value1",
//               ),
                

//                 ),
//                 ),
//               ),
//             ),
//  Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Padding(padding: EdgeInsets.all(3),
//                 child: TextField(
//                    onChanged: (value) {
//     hum = value as Float ;
//   },
                  
//                    keyboardType: TextInputType.number,
//                        decoration: InputDecoration(
//                 hintText: "Enter your Value2",
//               ),
        

//                 ),
//                 ),
//               ),
//             ),
//              Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Padding(padding: EdgeInsets.all(3),
//                 child: TextField(
//                    onChanged: (value) {
//     soil = value as Float ;
//     },
               
//                   keyboardType: TextInputType.number,
//                        decoration: InputDecoration(
//                 hintText: "Enter your Value3",
//               ),
                   
//                 ),
//                 ),
//               ),
//             ),
//              Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Padding(padding: EdgeInsets.all(3),
//                 child: TextField(
//                    onChanged: (value) {
//     area = value as Float ;
//   },
                
//                  keyboardType: TextInputType.number,
//                        decoration: InputDecoration(
//                 hintText: "Enter your Value4",
//               ),
                 
//                 ),
//                 ),
//               ),
//             ),
//  Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Padding(padding: EdgeInsets.all(3),
//                 child: TextField(
//                    onChanged: (value) {
//     sample = value as Float ;
//   },
//                    keyboardType: TextInputType.number,
//                        decoration: InputDecoration(
//                 hintText: "Enter your Value5",
//               ),
                    
//                 ),
//                 ),
//               ),
//             ),


//             Text(
//               "change the input values in code to get the prediction",
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 12),
//             MaterialButton(
//               color: Colors.blue,
//               child: Text(
//                 "predict",
//                 style: TextStyle(fontSize: 25),
//               ),
//               onPressed: (() {
//                   predData;
//               })
              
//             ),
//             SizedBox(height: 12),
//             Text(
//               "Predicted value :  $predValue ",
//               style: TextStyle(color: Colors.red, fontSize: 23),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
