
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:saca/Screens/Predict/components/dataset.dart';

class Investment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF0e9229),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Crop Yields Prediction"),

        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              color: Color(0xFF0e9229),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
            ),
          ),
          Column(
            children: [
              Market(),Recommended(),Return()
            ],
          )

        ])
        );
  }
}

class Return extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Prediction History",style:TextStyle(color : Color(0xff0e9229),fontSize: 18,fontWeight: FontWeight.bold,)),
          SizedBox(height: 15,),
          Graph()
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: LineChart(
        LineChartData(
          minX:0,
          maxX:12,
          minY:0,
          maxY:12,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(showTitles: true,
           // getTextStyles: (vale)=>TextStyle(color: Color(0xFF008CFF),fontWeight: FontWeight.bold,fontSize: 8),
            getTitles: (value){
              switch(value.toInt()){
                case 1:
                  return '12:09';
                case 2:
                  return '12:04';
                case 3:
                  return '11:30';
                case 4:
                  return '11:03';
                case 5:
                  return '10:30';
                case 6:
                  return '10:23';
                case 7:
                  return '10:08';
                case 8:
                  return '9:23';
                case 9:
                  return '9:20';
                case 10:
                  return '9:00';
                case 11:
                  return '8:09';
                case 12:
                  return '8:00';
              }
              return '';
            }
            )
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              colors: [
                Color(0xFF23B6E6),
                Color(0xFF02D39A)
              ],
              barWidth: 5,
                isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: true,
              colors: [
                ColorTween(
                  begin: Color(0xFF23B6E6),
                  end: Color(0xFF02D39A)
                ).lerp(0.2)!.withOpacity(0.1)
              ]),
              aboveBarData:  BarAreaData(show: true,
                  colors: [
                    ColorTween(
                        begin: Color(0xFF23B6E6),
                        end: Color(0xFF02D39A)
                    ).lerp(0.2)!.withOpacity(0.1)
                  ]),
              spots: [
                FlSpot(0, 0),
                FlSpot(1, 5),
                FlSpot(2, 4),
                FlSpot(3, 6),
                FlSpot(4, 4),
                FlSpot(5, 6),
                FlSpot(6, 7),
                FlSpot(7, 8),
                FlSpot(8, 7),
                FlSpot(9, 9),
                FlSpot(10, 6),
                FlSpot(11, 8),
                FlSpot(12, 9),
              ]
            )
          ]
        )
      ),
    );
  }
}



//
// class Return extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text("Return on Investment",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//           SizedBox(height: 15,),
//           Graph()
//         ],
//       ),
//     );
//   }
// }

// class Graph extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120,
//       child: LineChart(LineChartData(
//         minX: 0,
//         maxX:12,
//         minY:0,
//         maxY:12,
//         gridData: FlGridData(show: false),
//         borderData: FlBorderData(show: false),
//         titlesData: FlTitlesData(
//           leftTitles: SideTitles(
//             showTitles: false,
//           ),
//           bottomTitles: SideTitles(
//             showTitles: true,
//             getTextStyles: (value)=>TextStyle(color: Color(0xFF008CFF),
//             fontWeight: FontWeight.bold,fontSize: 16),
//             getTitles: (value){
//               switch (value.toInt()){
//                 case 1:
//                   return 'J';
//                 case 2:
//                   return 'F';
//                 case 3:
//                   return 'M';
//                 case 4:
//                   return 'A';
//                 case 5:
//                   return 'M';
//                 case 6:
//                   return 'J';
//                 case 7:
//                   return 'J';
//                 case 8:
//                   return 'A';
//                 case 9:
//                   return 'S';
//                 case 10:
//                   return 'O';
//                 case 11:
//                   return 'N';
//                 case 12:
//                   return 'D';
//               }
//               return '';
//             }
//           )
//         ),
//         lineBarsData: [
//           LineChartBarData(
//             isCurved: true,
//             colors:[
//               Color(0xFF23b6e6),
//               Color(0xFF02D39A)
//             ],
//             barWidth: 5,isStrokeCapRound: true,
//             dotData: FlDotData(show:false),
//             belowBarData: BarAreaData(show:true,colors:
//             [
//               ColorTween(
//                 begin:Color(0xFF23B6e6),
//                 end: Color(0xFF02D39A)
//               ).lerp(0.2).withOpacity(0.1)
//             ]),
//             aboveBarData: BarAreaData(show:true,colors:
//             [
//               ColorTween(
//                   begin:Color(0xFF23B6e6),
//                   end: Color(0xFF02D39A)
//               ).lerp(0.2).withOpacity(0.1)
//             ]),
//             spots:[
//               FlSpot(0,4),
//               FlSpot(1,8),
//               FlSpot(2,2),
//               FlSpot(3,3),
//               FlSpot(4,6),
//               FlSpot(5,7),
//               FlSpot(6,5),
//               FlSpot(7,3),
//               FlSpot(8,6),
//               FlSpot(9,5),
//               FlSpot(10,7),
//               FlSpot(11,8),
//               FlSpot(12,9),
//
//             ]
//           )
//         ]
//       )),
//     );
//   }
// }



class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Input the following features",style:TextStyle(fontSize: 18,color : Color(0xff0e9229),fontWeight: FontWeight.bold)),
             
            ],
          ),
          Column(
            children: [
              RecommendedItem(name: recommendedList[0].name,
              value:recommendedList[0].value,
              icon:recommendedList[0].icon),
              RecommendedItem(name: recommendedList[1].name,
                   value:recommendedList[1].value,
                  icon:recommendedList[1].icon),
              RecommendedItem(name: recommendedList[2].name,
                   value:recommendedList[2].value,
                  icon:recommendedList[2].icon),
              RecommendedItem(name: recommendedList[3].name,
                value:recommendedList[3].value,
              icon:recommendedList[3].icon)
           ],
          )
        ],
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  final String name;
  final String value;
  final String icon;
  RecommendedItem({required this.name,required this.value,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 0.2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width:20,
                height:20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: AssetImage(icon))
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                    style: TextStyle(color:Color(0xff0e9229),fontSize: 18,fontWeight: FontWeight.bold),),
                    
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff0e9229)
              ),
            ),
          )
        ],
      ),
    );
  }
}


class Market extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          SizedBox(height: 8,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
               
              ],
            ),
          )
        ],
      ),
    );
  }
}










