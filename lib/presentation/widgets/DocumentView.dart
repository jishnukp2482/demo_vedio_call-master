import 'dart:io';

import 'package:demo_vedio_call/presentation/manager/DocumentController.dart';
import 'package:demo_vedio_call/presentation/widgets/imageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/DocumentModel.dart';

class DocumentView extends StatefulWidget {
  const DocumentView({super.key});

  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  final controller = Get.find<DocumentController>();

  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.documentlist.length,
        itemBuilder: (context, index) {
          return DocumentItem(model: controller.documentlist[index]);
        },
      ),
    );
  }
}

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key, required this.model});
  final DocuMentModel model;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
        child: Card(
          elevation: 5,
          color: Colors.grey.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: model.image.contains("assets/")
                      ? Image.asset(
                          model.image,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(model.image),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  model.title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Place it on a white paper in good\nlighting",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "View Instructions",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Column(
                      children: [
                        model.image.contains("assets/")
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  Get.to(ImageView(
                                      image: model.image,
                                      type: ImageType.file));
                                },
                                child: Text(
                                  "View Image",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                )),
                        SizedBox(
                          height: 2,
                        ),
                        ElevatedButton(
                          onPressed: () => model.ontap(),
                          child: const Text("Take Photo"),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
