import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String img;
  


  const Category({required this.id,required this.title,this.color = const Color(0xff0e9229),required this.img});
}