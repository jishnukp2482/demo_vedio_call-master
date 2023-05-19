import 'dart:io';

import 'package:demo_vedio_call/presentation/manager/DocumentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, required this.image, required this.type});
  final String image;
  final ImageType type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              title: Text(
                "View Image",
              ),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: InteractiveViewer(
              maxScale: 6,
              minScale: 0.1,
              child: type == ImageType.asset
                  ? Image.asset(image)
                  : type == ImageType.network
                      ? Image.network(image)
                      : type == ImageType.file
                          ? Image.file(File(image))
                          : SizedBox()),
            )));
  }
}

enum ImageType {
  file,
  asset,
  network,
}
