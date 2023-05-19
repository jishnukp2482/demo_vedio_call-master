import 'package:flutter/material.dart';

class GridModel {
  final IconData iconData;

  final String title;
  final Function ontap;
  GridModel({required this.title, required this.ontap, required this.iconData});
}
