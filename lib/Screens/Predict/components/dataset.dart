import 'package:flutter/material.dart';
class Recommended{
  final String name;
  final String icon;
  final String value;
  Recommended({required this.name, required this.icon, required this.value});
}

List<Recommended> recommendedList=[
  Recommended(name: "Temperature",value: "Input Temperature",icon: ""),
  Recommended(name: "Soil Moisture",value: "Input Soil Moisture",icon: ""),
  Recommended(name: "Humidity",value: "Input Humidity",icon: ""),
  Recommended(name: "Area",value: "Input Area",icon: "")

];
