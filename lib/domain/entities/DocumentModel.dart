import 'package:flutter/material.dart';

class DocuMentModel {
  final int id;
  String image;
  final Function ontap;
  final String title;

  DocuMentModel(
      {required this.image,
      required this.ontap,
      required this.title,
      required this.id});
}
